# frozen_string_literal: true

require_relative 'Statement'
require_relative 'Transaction'
require 'date'

# Class for the Account app
class Account
  attr_reader :current_balance

  def initialize
    @current_balance = 0
    @transactions = []
    # @date = DateTime.now.strftime '%d/%m/%Y'
  end

  def deposit(amount)
    @current_balance += amount
    create_transaction(amount)

    #@transactions << "#{@date} ||  #{'%.2f' % amount}  ||    ||  #{'%.2f' % @current_balance}"
  end

  def withdraw(amount)
    raise 'Your withdrawal exceeds your current balance.' if amount > @current_balance
    @current_balance -= amount
    create_transaction(amount, 'credit')

    #@transactions << "#{@date} ||    ||  #{'%.2f' % amount}  ||  #{'%.2f' % @current_balance}"
  end

  def statement(statement_class = Statement)
    statement_class.print(@transactions.reverse)
    # statement = Statement.new
    # statement.print
    # transaction = @transactions.reverse.join("\n")
    # puts statement.headers + transaction
  end

  def create_transaction(amount, type=nil, transaction_class = Transaction)
    @transactions << transaction_class.create(amount, @current_balance, type)
  end

  private :create_transaction

end
