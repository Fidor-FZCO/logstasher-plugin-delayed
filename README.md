# LogstasherPluginDelayed [![Gem Version](https://badge.fury.io/rb/logstasher-plugin-delayed.png)](http://badge.fury.io/rb/logstasher) [![Build Status](https://secure.travis-ci.org/marcgrimme/logstasher-plugin-delayed.png)](https://secure.travis-ci.org/marcgrimme/logstasher-plugin-delayed)

This is the first plugin for the plugin infrastructure supported by [logstasher](https://github.com/shadabahmed/logstasher) to add logstasher and request based logging to logstash.

Before 'logstasher-plugin-delayed'

```
{"sql":"SELECT `delayed_jobs`.* FROM `delayed_jobs` WHERE ((run_at <= '2015-10-25 17:45:58' AND (locked_at IS NULL OR locked_at < '2015-10-25 13:45:58') OR locked_by = 'delayed_job host:marclaptop pid:9681') AND failed_at IS NULL) ORDER BY priority ASC, run_at ASC, id ASC LIMIT 5 /*application:Banking*/","name":"Delayed::Backend::ActiveRecord::Job Load","connection_id":25418200,"binds":[],"duration":0.42,"tags":["request"],"@timestamp":"2015-10-25T17:45:58Z","@version":"1"}
{"sql":"SELECT `users`.* FROM `users` ORDER BY `users`.`id` DESC LIMIT 1 /*application:Banking*/","name":"User Load","connection_id":33378460,"binds":[],"duration":0.42,"tags":["request"],"@timestamp":"2015-10-25T17:46:00Z","@version":"1"}
{"sql":"SELECT `delayed_jobs`.* FROM `delayed_jobs` WHERE ((run_at <= '2015-10-25 17:46:00' AND (locked_at IS NULL OR locked_at < '2015-10-25 13:46:00') OR locked_by = 'delayed_job host:marclaptop pid:9681') AND failed_at IS NULL) ORDER BY priority ASC, run_at ASC, id ASC LIMIT 5 /*application:Banking*/","name":"Delayed::Backend::ActiveRecord::Job Load","connection_id":25418200,"binds":[],"duration":0.3,"tags":["request"],"@timestamp":"2015-10-25T17:46:00Z","@version":"1"}
```

After 'logstasher-plugin-delayed'
```
{"sql":"SELECT `delayed_jobs`.* FROM `delayed_jobs` WHERE ((run_at <= '2015-10-25 17:45:58' AND (locked_at IS NULL OR locked_at < '2015-10-25 13:45:58') OR locked_by = 'delayed_job host:marclaptop pid:9681') AND failed_at IS NULL) ORDER BY priority ASC, run_at ASC, id ASC LIMIT 5 /*application:Banking*/","name":"Delayed::Backend::ActiveRecord::Job Load","connection_id":25418200,"binds":[],"duration":0.42,"operator":"marc","request_id":10,"source":"FOS Banking Delayed Job","tags":["request"],"@timestamp":"2015-10-25T17:45:58Z","@version":"1"}
{"sql":"SELECT `users`.* FROM `users` ORDER BY `users`.`id` DESC LIMIT 1 /*application:Banking*/","name":"User Load","connection_id":33378460,"binds":[],"duration":0.42,"operator":"marc","request_id":"3719","source":"FOS Banking Console","tags":["request"],"@timestamp":"2015-10-25T17:46:00Z","@version":"1"}
{"sql":"SELECT `delayed_jobs`.* FROM `delayed_jobs` WHERE ((run_at <= '2015-10-25 17:46:00' AND (locked_at IS NULL OR locked_at < '2015-10-25 13:46:00') OR locked_by = 'delayed_job host:marclaptop pid:9681') AND failed_at IS NULL) ORDER BY priority ASC, run_at ASC, id ASC LIMIT 5 /*application:Banking*/","name":"Delayed::Backend::ActiveRecord::Job Load","connection_id":25418200,"binds":[],"duration":0.3,"operator":"marc","request_id":10,"source":"FOS Banking Delayed Job","tags":["request"],"@timestamp":"2015-10-25T17:46:00Z","@version":"1"}
```

You see now we see a request_id which basically is the id of delayed job. All susequent to this DJ belonging logs will have this request id.

## Installation

In your Gemfile:

    gem 'logstasher'
    gem 'logstasher-plugin-delayed'

Configure your <environment>.rb e.g. development.rb

    # Enable delayed job logstaher logs for the current environment
    config.logstasher_plugin_delayed = true

## Versions
All versions require Rails 3.0.x and higher and Ruby 2.1+. Tested on Rails 3.2 and Ruby 2.1

## Development
 - Run tests - `rake`
 - Generate test coverage report - `rake coverage`. Coverage report path - coverage/index.html

## Copyright

Copyright (c) 2015 Marc Grimme, released under the MIT license


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/marcgrimme/logstasher-plugin-delayed/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
