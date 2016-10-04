require 'oyster_card'

describe OysterCard do
subject(:oyster_card) { described_class.new }
subject(:topped_up_card) {described_class.new(10)}


	it 'initializes a zero balance by default' do
		expect(oyster_card.balance).to eq 0
	end

	it 'card responds to top_up' do
		expect(oyster_card).to respond_to(:top_up).with(1).argument
	end

	it 'Adds money to the card' do
		oyster_card.top_up(10)
		expect(oyster_card.balance).to eq 10
	end

	it 'Sets a maxium of 90' do
		expect{oyster_card.top_up(95)}.to raise_error "Card limit reached(£#{OysterCard::MAX_VALUE})"
	end

	it 'deducts money from the card' do
		topped_up_card.deduct(5)
		expect(topped_up_card.balance).to eq 5
	end

end
