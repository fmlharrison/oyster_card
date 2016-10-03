require 'oyster_card' 

describe OysterCard do
subject(:oyster_card) { OysterCard.new }


	it 'initializes a zero balance by default' do
		expect(subject.balance).to eq 0
	end 
end 