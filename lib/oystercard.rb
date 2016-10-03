class Oystercard
  attr_reader :balance, :entry_station
  MAX_BALANCE = 90
  MIN_AMOUNT = 1

  def initialize(balance=0)
    @balance = balance

  end

  def top_up(value)
    fail "Card limit (£#{Oystercard::MAX_BALANCE}) reached" if balance + value > MAX_BALANCE
    @balance += value
  end

  def touch_in(station)
    fail "Not enough funds on card, please top up" if balance < MIN_AMOUNT
    @entry_station = station
  end

  def touch_out
    deduct(1)
    @entry_station = nil
  end

  def in_journey?
    !@entry_station.nil?
  end

  private

  def deduct(value)
    @balance -= value
  end

end
