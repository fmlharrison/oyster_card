require 'oystercard'

describe Oystercard do
  subject(:card) {described_class.new}
  subject(:topped_up_card) {described_class.new(10)}

  it "has a balance of 0 to start with" do
    expect(card.balance).to eq(0)
  end

  it "can be topped up" do
    card.top_up(5)
    expect(card.balance).to eq 5
  end

  it "has a max balance of 90" do
    expect{card.top_up(91)}.to raise_error("Card limit (£#{Oystercard::MAX_BALANCE}) reached")
  end

  it "doesn't let you touch in if the card has let than £1 on it" do
    expect{card.touch_in}.to raise_error("Not enough funds on card, please top up")
  end

  it "money can be decuted from the card" do
    topped_up_card.deduct(8)
    expect(topped_up_card.balance).to eq 2
  end

  it "is able to start a journey by touching in" do
    topped_up_card.touch_in
    expect(topped_up_card).to be_in_journey
  end

  it "is able to end a journey by touching out" do
    card.touch_out
    expect(card).not_to be_in_journey
  end

end
