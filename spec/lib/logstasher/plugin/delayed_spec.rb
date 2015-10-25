require 'spec_helper'

describe LogStasher::Plugin::Delayed do

  describe '.delayed_jobs_support' do
    context 'when enabled' do
      let(:delayed_plugin_config){ double(:enabled => true) }
      it 'does not load the delayed job plugin' do
        expect(LogStasher::Plugin::Delayed).to_not receive(:require).with('logstasher/plugin/delayed/plugin')
        LogStasher::Plugin::Delayed.setup(delayed_plugin_config)
      end

      it 'loades the delayed job plugin' do
        LogStasher::Plugin::Delayed.setup(delayed_plugin_config)
        expect(Delayed::Worker.plugins).to include(::LogStasher::Plugin::Delayed::Plugin)
      end
    end
  end
end
