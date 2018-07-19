RSpec.describe 'Configuration' do
  let(:configuration) { Wisper.configuration }

  it 'configures resque as a broadcaster' do
    expect(configuration.broadcasters).to include :resque
  end

  it 'configures resque as default async broadcaster' do
    expect(configuration.broadcasters[:async])
      .to be_an_instance_of(Wisper::ResqueBroadcaster)
  end
end
