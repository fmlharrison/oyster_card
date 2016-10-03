class Oystercard
  attr_reader :balance
  MAX_BALANCE = 90

  def initialize(balance=0)
    @balance = balance
  end

  def top_up(value)
    fail "Card limit (£#{Oystercard::MAX_BALANCE}) reached" if balance + value > MAX_BALANCE
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end
end
