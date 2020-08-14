# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:credit_transaction) { double :transaction, date: Date.today, amount: 1000, current_balance: 1000, type: nil }
  let(:debit_transaction) { double :transaction, date: Date.today, amount: 500, current_balance: 500, type: 'credit' }
  let(:transactions_array) { [credit_transaction] }

  describe 'print' do
    it 'prints the correct format of the transactions' do
      print_statement = <<~STATEMENT
        date || credit || debit || balance
        #{Date.today} ||  1000.00  ||    ||  1000.00
      STATEMENT
      expect {Statement.print(transactions_array)}.to output(print_statement).to_stdout
    end
  end

  describe 'isCredit?' do
    it 'can tell that a transaction is a deposit' do
      expect(Statement.is_credit?(credit_transaction)).to eq(nil)
    end
    it 'can tell that a withdrawal changes the type of the transaction to a credit' do
      expect(Statement.is_credit?(debit_transaction)).to eq(true)
    end
  end
end
