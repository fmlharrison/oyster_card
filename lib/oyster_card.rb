class OysterCard
	attr_reader :balance

	MAX_VALUE = 90

	def initialize(balance = 0)
		 @balance = balance
	end

	def top_up(money)
		raise 'Card limit reached(£90)' if balance + money > MAX_VALUE
		@balance += money

	end

end 
