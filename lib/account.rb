class Account

  attr_reader :current_balance

  def initialize
    @current_balance = 0
    @date = DateTime.now.strftime "%d/%m/%Y"
    @statment = ["#{@date} ||  #{@credit}  ||  #{@debit}  ||  #{@current_balance}"]
  end

  def deposit(amount)
    @credit = amount
    @current_balance += amount
    return @current_balance
  end

  def withdraw(amount)
    @debit = amount
    raise "Your withdrawal exceeds your current balance." if @debit > @current_balance
    @current_balance -= @debit
    return @current_balance
  end

  def statement
    return @statment
  end

end