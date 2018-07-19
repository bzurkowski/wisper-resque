RSpec.describe Wisper::ResqueBroadcaster do
  describe '#broadcast' do
    let(:listener)  { double(:listener) }
    let(:publisher) { double(:publisher) }

    it 'enqueues a Resque listener job' do
      expect(Resque).to receive(:enqueue).with(listener, :event_name, 2, 3)

      subject.broadcast(listener, publisher, :event_name, [2, 3])
    end
  end

  describe '.register' do
    let(:config) { double(:config) }

    it 'registers broadcasters with the configuration' do
      expect(Wisper).to receive(:configure).and_yield(config)
      expect(config).to receive(:broadcaster).with(:resque, an_instance_of(described_class))
      expect(config).to receive(:broadcaster).with(:async, an_instance_of(described_class))

      described_class.register
    end
  end
end
