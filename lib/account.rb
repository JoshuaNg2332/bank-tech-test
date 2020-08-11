class Account

  attr_reader :current_balance

  def initialize
    @current_balance = 0
  end

  def deposit(amount)
    @current_balance += amount
    return @current_balance
  end

  def withdraw(amount)
    raise "Your withdrawal exceeds your current balance." if amount > @current_balance
    @current_balance -= amount
    return @current_balance
  end

end