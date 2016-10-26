module Wisper
  module Broadcasters
    class ResqueBroadcaster
      def broadcast(listener, _publisher, event, *args)
        ::Resque.enqueue listener, event, *args
      end

      def self.register
        Wisper.configure do |config|
          config.broadcaster :resque, ResqueBroadcaster.new
          config.broadcaster :async,  ResqueBroadcaster.new
        end
      end
    end
  end
end
