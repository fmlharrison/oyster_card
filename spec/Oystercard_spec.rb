require 'oyster_card'

describe OysterCard do
subject(:oyster_card) { described_class.new }
subject(:topped_up_card) {described_class.new(10)}

let(:station) {double :station}

	describe 'initializing a card' do
		it 'initializes a zero balance by default' do
			expect(oyster_card.balance).to eq 0
		end

		it 'initializes a not in journey' do
			expect(oyster_card.in_journey?).to eq false
		end

		it 'initializes without an entry station' do
			expect(oyster_card.entry_station).to eq(nil)
		end
	end

	describe '#top_up' do

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
	end	

 	describe '#touch_in' do
		it 'changes card to be on a journey when touched in' do
			topped_up_card.touch_in(station)
			expect(topped_up_card).to be_in_journey
		end

		it 'doesn\'t allow card to be touched in with insufficient funds - min £1' do
			expect{oyster_card.touch_in(station)}.to raise_error "Insufficient funds, please top up"
		end

		it 'sets an entry station on touch in' do
			topped_up_card.touch_in(station)
			expect(topped_up_card.entry_station).to eq station
		end

		it "it charges the MIN VALUE on touch in" do
			expect{topped_up_card.touch_in(station)}.to change{topped_up_card.balance}.by(-OysterCard::MIN_VALUE)
		end
	end
	describe '#touch_out' do

		before do
			topped_up_card.touch_in(station)
		end

		it 'changes card to be not on a journey when touched out' do
			topped_up_card.touch_out
			expect(topped_up_card).not_to be_in_journey
		end

		it 'forgets the entry station on touch out' do
			topped_up_card.touch_out
			expect(topped_up_card.entry_station).to eq nil
		end

		it 'deducts money from the card when touched out' do 
			expect{topped_up_card.touch_out}.to change{topped_up_card.balance}.by(-1)
		end 
	end

end
