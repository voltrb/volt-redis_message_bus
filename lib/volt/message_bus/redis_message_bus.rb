require 'redis'
require 'volt/server/message_bus/base_message_bus'

module Volt
  module MessageBus
    class Redis < BaseMessageBus
      class Subscription
        def initialize(redis)
          @redis = redis
        end

        def remove
          @redis.unsubscribe
        end
      end

      def initialize(volt_app)
        @redis = new_connection
      end

      # Subscribe should return an object that you can call .remove on to stop
      # the subscription.
      def subscribe(channel_name, &block)
        sub_redis = new_connection

        Thread.new do
          # Since the Redis driver does not have a connection pool, we create a
          # new connection each time we subscribe.
          # Note: internally volt does only 1 subscription.
          sub_redis.subscribe(channel_name.to_sym) do |on|
            on.message do |channel_name, message|
              block.call(message)
            end
          end
        end

        Subscription.new(sub_redis)
      end

      # publish should push out to all subscribed within the volt cluster.
      def publish(channel_name, message)
        @redis.publish(channel_name.to_sym, message)
      end

      def new_connection
        msg_bus = Volt.config.message_bus
        if msg_bus && (opts = msg_bus.connect_options)
          ::Redis.new(opts)
        else
          ::Redis.new
        end
      end

      # waits for all messages to be flushed and closes connections
      def disconnect!
        raise "Not implemented"
      end
    end
  end
end
