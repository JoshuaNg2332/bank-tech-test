# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:statement) { Statement.new }
  let(:transaction) { double :transaction, date: Date.today, amount: 10, balance: 20, type: 'credit' }
  let(:transactions_array) { [transaction] }

  describe 'Headers' do
    it 'can display the headers' do
      expect(statement.headers).to eq("date || credit || debit || balance\n")
    end
  end

  describe 'isCredit?' do
    it 'can tell that a withdrawal changes the type of the transaction to a credit' do
      expect(Statement.is_credit?(transaction)).to eq(true)
    end
  end
end
