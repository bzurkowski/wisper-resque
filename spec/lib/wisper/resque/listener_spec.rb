RSpec.describe Wisper::Resque::Listener do
  let(:subscriber_class) do
    Class.new do
      extend Wisper::Resque::Listener

      def it_happened(a, b)
        a + b
      end
    end
  end

  let(:subscriber_instance) { double :subscriber_instance }

  it 'delegates event to subscriber instance method' do
    expect(subscriber_class).to receive(:new).and_return subscriber_instance
    expect(subscriber_instance).to receive(:it_happened).with(2, 3)
    subscriber_class.perform :it_happened, 2, 3
  end
end
