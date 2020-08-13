# frozen_string_literal: true

require_relative 'statement'
require 'date'

# Class for the Account app
class Account
  attr_reader :current_balance

  def initialize
    @current_balance = 0
    @transactions = []
  end

  def deposit(credit, date)
    @current_balance += credit

    date = DateTime.now.strftime '%d/%m/%Y' if date == nil

    @transactions << "#{date} ||  #{'%.2f' % credit}  ||    ||  #{'%.2f' % @current_balance}"
  end

  def withdraw(debit, date)
    raise 'Your withdrawal exceeds your current balance.' if debit > @current_balance
    @current_balance -= debit
    date = Time.now.strftime('%d/%m/%Y') if date == nil

    @transactions << "#{date} ||    ||  #{'%.2f' % debit}  ||  #{'%.2f' % @current_balance}"
  end

  def statement
    statement = Statement.new
    transaction = @transactions.reverse.join("\n")
    puts statement.headers + transaction
  end
end
