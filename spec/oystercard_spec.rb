require 'oystercard'

describe Oystercard do
  subject(:card) {described_class.new}
  it "has a balance of 0 to start with" do
    expect(card.balance).to eq(0)
  end
end
