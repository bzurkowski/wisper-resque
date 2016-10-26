require 'wisper'
require 'resque'

require 'wisper/resque/version'
require 'wisper/resque/listener'

require 'wisper/broadcasters/resque_broadcaster'

module Wisper
  module Resque
    def self.setup
      Broadcasters::ResqueBroadcaster.register
    end
  end
end

Wisper::Resque.setup
