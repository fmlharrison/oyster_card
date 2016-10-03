class Oystercard
  attr_reader :balance
  MAX_BALANCE = 90
  MIN_AMOUNT = 1

  def initialize(balance=0)
    @balance = balance
    @journey = false

  end

  def top_up(value)
    fail "Card limit (£#{Oystercard::MAX_BALANCE}) reached" if balance + value > MAX_BALANCE
    @balance += value
  end

  def touch_in
    fail "Not enough funds on card, please top up" if balance < MIN_AMOUNT
    @journey = true
  end

  def touch_out
    deduct(1)
    @journey = false
  end

  def in_journey?
    @journey
  end

  private

  def deduct(value)
    @balance -= value
  end

end
