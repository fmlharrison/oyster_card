class Oystercard
  attr_reader :balance, :journey_list, :current_journey
  MAX_BALANCE = 90
  MIN_AMOUNT = 1

  def initialize(balance=0)
    @balance = balance
    @journey_list = []
    @current_journey = {entry_station: nil, exit_station: nil}
  end

  def top_up(value)
    fail "Card limit (£#{Oystercard::MAX_BALANCE}) reached" if balance + value > MAX_BALANCE
    @balance += value
  end

  def touch_in(station)
    fail "Not enough funds on card, please top up" if balance < MIN_AMOUNT
    set_entry_station(station)
    set_exit_station(nil)
  end

  def touch_out(station)
    deduct(1)
    set_exit_station(station)
    log_journey
  end

  def in_journey?
    !@current_journey[:entry_station].nil?
  end

  private

  def deduct(value)
    @balance -= value
  end

  def log_journey
    @journey_list << @current_journey
    @current_journey = {entry_station: nil, exit_station: nil} 
  end

  def set_entry_station(place)
    @current_journey[:entry_station] = place
  end

  def set_exit_station(place)
    @current_journey[:exit_station] = place
  end

end
