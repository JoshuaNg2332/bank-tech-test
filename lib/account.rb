require_relative 'statement'
require 'date'

class Account

  attr_reader :current_balance

  def initialize
    @current_balance = 0
    @transactions = []
  end

  def deposit(amount, date)
    @credit = amount
    @current_balance += amount

    if date == nil
      @date = DateTime.now.strftime "%d/%m/%Y"
    end

    @date = date

    @transactions << ("#{@date} ||  #{@credit}  ||    ||  #{@current_balance}")
  end

  def withdraw(amount, date)
    @debit = amount
    raise "Your withdrawal exceeds your current balance." if @debit > @current_balance
    @current_balance -= @debit
    

    if date == nil
      date = Time.now.strftime("%d/%m/%Y")
    end

    @date = date

    @transactions << ("#{@date} ||    ||  #{@debit}  ||  #{@current_balance}")
  end

  def statement
    statement = Statement.new
    transaction = @transactions.join("\n")
    statement.headers + transaction
  end

end