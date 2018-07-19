require 'wisper'
require 'resque'

require 'wisper/resque/version'

module Wisper
  class ResqueBroadcaster
    def broadcast(listener, _publisher, event, args)
      ::Resque.enqueue(listener, event, *args)
    end

    def self.register
      Wisper.configure do |config|
        config.broadcaster :resque, ResqueBroadcaster.new
        config.broadcaster :async,  ResqueBroadcaster.new
      end
    end
  end
end

Wisper::ResqueBroadcaster.register
