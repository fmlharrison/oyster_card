class Oystercard
  attr_reader :balance
  MAX_BALANCE = 90

  def initialize(balance=0)
    @balance = balance
    @journey = false

  end

  def top_up(value)
    fail "Card limit (£#{Oystercard::MAX_BALANCE}) reached" if balance + value > MAX_BALANCE
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def touch_in
    @journey = true
  end

  def touch_out
    @journey = false
  end

  def in_journey?
    @journey
  end
end
