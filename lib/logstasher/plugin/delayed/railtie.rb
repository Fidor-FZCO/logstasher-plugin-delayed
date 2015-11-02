require 'rails/railtie'

module LogStasher
  module Plugin
    module Delayed
      class Railtie < Rails::Railtie
        config.logstasher_plugin_delayed = ::ActiveSupport::OrderedOptions.new
        config.logstasher_plugin_delayed.enabled = false

        initializer :logstasher_plugin_delayed do
          config.after_initialize do
            LogStasher::Plugin::Delayed.setup(config.logstasher_plugin_delayed) if config.logstasher_plugin_delayed.enabled
          end
        end
      end
    end
  end
end
