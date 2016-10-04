class OysterCard
	attr_reader :balance
	def initialize(balance = 0)
		 @balance = balance
	end 

	def top_up(money)
		raise 'Card limit reached(£90)' if balance + money > 90
		@balance += money

	end 

end 