module Wisper
  module Resque
    module Listener
      def perform(event, *args)
        new.public_send event, *args
      end
    end
  end
end
