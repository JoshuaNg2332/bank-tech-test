# frozen_string_literal: true

require 'account'

describe Account do
  let(:account) { Account.new }

  before do
    @time_now = Time.now.strftime('%d/%m/%Y')
  end

  describe 'Balance' do
    it 'has a starting balance of 0' do
      expect(account.current_balance).to eq(0)
    end
  end

  describe 'Deposit' do
    it 'adds 100 to the balance' do
      account.deposit(100, '12/08/2020')
      expect(account.current_balance).to eq(100)
    end
  end

  describe 'Withdraw' do
    it 'adds 100 then subtracts 50 from the balance' do
      account.deposit(100, '12/08/2020')
      account.withdraw(50, '12/08/2020')
      expect(account.current_balance).to eq(50)
    end

    it 'raises error when you try to withdraw more money than current balance.' do
      account.deposit(100, '12/08/2020')
      expect { account.withdraw(200, '12/08/2020') }.to raise_error 'Your withdrawal exceeds your current balance.'
    end
  end

  describe 'Printing the statement' do
    it 'grabs previous deposit and prints out the bank statement incl. date, transaction and current balance.' do
      account.deposit(1000, '12/08/2020')
      statement = <<~STATEMENT
        date || credit || debit || balance
        12/08/2020 ||  1000.00  ||    ||  1000.00
      STATEMENT
      expect { account.statement }.to output(statement).to_stdout
    end

    it 'grabs previous transactions and prints out the bank statement incl. date, transaction and current balance.' do
      account.deposit(1000, '12/08/2020')
      account.withdraw(500, '12/08/2020')
      statement = <<~STATEMENT
        date || credit || debit || balance
        12/08/2020 ||    ||  500.00  ||  500.00
        12/08/2020 ||  1000.00  ||    ||  1000.00
      STATEMENT
      expect { account.statement }.to output(statement).to_stdout
    end

    it 'prints out current date if no date is provided' do
      account.deposit(1000, nil)
      account.withdraw(400, nil)
      allow(Time).to receive(:now).and_return(@time_now)
      statement = <<~STATEMENT
        date || credit || debit || balance
        #{@time_now} ||    ||  400.00  ||  600.00
        #{@time_now} ||  1000.00  ||    ||  1000.00
      STATEMENT
      expect { account.statement }.to output(statement).to_stdout
    end
  end
end
