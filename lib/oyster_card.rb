class OysterCard
	attr_reader :balance, :entry_station

	MAX_VALUE = 90
	MIN_VALUE = 1

	def initialize(balance = 0)
		 @balance = balance
		 @entry_station = nil
	end

	def top_up(money)
		raise 'Card limit reached(£90)' if balance + money > MAX_VALUE
		@balance += money
	end

	def in_journey?
		!entry_station.nil?
	end

	def touch_in(station)
		raise 'Insufficient funds, please top up' if balance < MIN_VALUE
		@entry_station = station
	end

	def touch_out
		deduct(MIN_VALUE)
		@entry_station = nil
	end

	private

	def deduct(value)
		@balance -= value
	end

end
