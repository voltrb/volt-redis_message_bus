# Volt::RedisMessageBus

This provides a simple Redis based message bus.  Volt requires a way to send messages between all nodes in an app.  By default volt uses the "Peer to Peer" message bus strategy, which makes socket connections between the app instances, using the database as a way to coordinate ip and port ranges.  This strategy requires no setup if the machines can send packets, however sometimes this is not possible.  Heroku for example makes this difficult.

For smaller to medium deployments, the redis message bus is a simple solution.  All app instances connect to a single redis server and messages are broadcast between instances through redis's pubsub feature.

## Usage

In your Gemfile add:

```gem 'volt-redis_message_bus'```

In your ```config/app.rb```, add:

```ruby
config.message_bus.bus_name = 'redis'
config.message_bus.connect_options = {:host => "10.0.1.1", :port => 6380, :db => 15}
```

The connect_options will be passed to the redis gem's Redis.new as a hash.  See the [redis gem](https://github.com/redis/redis-rb#getting-started) for more docs.