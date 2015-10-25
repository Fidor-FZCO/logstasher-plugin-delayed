require 'logstasher/plugin/delayed/version'
require 'logstasher/plugin/delayed/plugin'

module LogStasher
  module Plugin
    module Delayed
      extend self
      def setup(config)
        if config.enabled || false
          ::Delayed::Worker.plugins << ::LogStasher::Plugin::Delayed::Plugin
        end
      end

      def enabled?
        self.enabled || false
      end
    end
  end
end

require 'logstasher/plugin/delayed/railtie' if defined?(Rails)
