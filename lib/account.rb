class Account

  attr_reader :current_balance

  def initialize
    @current_balance = 0
    @date = DateTime.now.strftime "%d/%m/%Y"
    @statement = []
  end

  def deposit(amount)
    @credit = amount
    @current_balance += amount

    @statement << ("#{@date} ||  #{@credit}  ||    ||  #{@current_balance}")
  end

  def withdraw(amount)
    @debit = amount
    raise "Your withdrawal exceeds your current balance." if @debit > @current_balance
    @current_balance -= @debit

    @statement << [@date , nil , @debit , @current_balance]
  end

  def statement
    return @statement
  end

end