class OysterCard
	attr_reader :balance

	MAX_VALUE = 90
	MIN_VALUE = 1

	def initialize(balance = 0)
		 @balance = balance
		 @in_journey = false
	end

	def top_up(money)
		raise 'Card limit reached(£90)' if balance + money > MAX_VALUE
		@balance += money
	end

	def deduct(value)
		@balance -= value
	end

	def in_journey?
		@in_journey
	end

	def touch_in
		raise 'Insufficient funds, please top up' if balance < MIN_VALUE
		@in_journey = true
	end

	def touch_out
		@in_journey = false
	end

end
