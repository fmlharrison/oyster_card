require 'oyster_card'

describe OysterCard do
subject(:oyster_card) { OysterCard.new }


	it 'initializes a zero balance by default' do
		expect(subject.balance).to eq 0
	end

	it 'card responds to top_up' do
		expect(subject).to respond_to(:top_up).with(1).argument
	end

	it 'Adds money to the card' do
	subject.top_up(10)
		expect(subject.balance).to eq 10
	end

	it 'Sets a maxium of 90' do
		expect{oyster_card.top_up(95)}.to raise_error "Card limit reached(£#{OysterCard::MAX_VALUE})" 
	end

end
