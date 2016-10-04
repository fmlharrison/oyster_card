class OysterCard
	attr_reader :balance, :entry_station, :journey_history, :current_journey

	MAX_VALUE = 90
	MIN_VALUE = 1

	def initialize(balance = 0)
		 @balance = balance
		 @journey_history = []
		 @current_journey = {entry_station: nil, exit_station: nil}
	end

	def top_up(money)
		raise 'Card limit reached(£90)' if balance + money > MAX_VALUE
		@balance += money
	end

	def in_journey?
		!current_journey[:entry_station].nil?
	end

	def touch_in(station)
		raise 'Insufficient funds, please top up' if balance < MIN_VALUE
		set_entry(station)
	end

	def touch_out(station)
		deduct(MIN_VALUE)
		set_exit(station)
		journey_logger
		clear_journeys
	end

	private

	def deduct(value)
		@balance -= value
	end

	def journey_logger
		@journey_history << @current_journey
	end

	def clear_journeys
		@current_journey = {entry_station: nil, exit_station: nil}
	end

	def set_entry(station)
		@current_journey[:entry_station] = station
	end

	def set_exit(station)
		@current_journey[:exit_station] = station
	end
end
