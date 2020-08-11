require_relative 'statement'

class Account

  attr_reader :current_balance

  def initialize
    @current_balance = 0
    @date = DateTime.now.strftime "%d/%m/%Y"
    @transactions = []
  end

  def deposit(amount)
    @credit = amount
    @current_balance += amount

    @transactions << ("#{@date} ||  #{@credit}  ||    ||  #{@current_balance}")
  end

  def withdraw(amount)
    @debit = amount
    raise "Your withdrawal exceeds your current balance." if @debit > @current_balance
    @current_balance -= @debit

    @transactions << ("#{@date} ||    ||  #{@debit}  ||  #{@current_balance}")
  end

  def statement
    statement = Statement.new
    transaction = @transactions.join("\n")
    return statement.headers + transaction
  end

end