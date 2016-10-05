require 'station'

describe Station do

  context 'initializing a new station class' do
    subject(:station) {described_class.new("King's", 1)}

    it 'initializes with a name' do
      expect(station.name).to eq("King's")
    end

    it 'initialize with zone' do
      expect(station.zone).to eq(1)
    end
  end

end
