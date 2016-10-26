RSpec.describe Wisper::Broadcasters::ResqueBroadcaster do
  describe '#broadcast' do
    let(:listener)  { double :listener }
    let(:publisher) { double :publisher }

    it 'enqueues resque listener job' do
      expect(Resque).to receive(:enqueue).with listener, :it_happened, 2, 3
      subject.broadcast listener, publisher, :it_happened, 2, 3
    end
  end
end
