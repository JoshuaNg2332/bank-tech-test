require 'statement'

describe Statement do

let(:statement) { Statement.new }

  describe 'Headers' do
    it 'can display the headers' do
      expect(statement.headers).to eq("date || credit || debit || balance")
    end
  end
  xdescribe 'Printing the statement'
    xit 'grabs previous transactions and prints out the bank statement including the date, transaction and current balance.' do
      account.deposit(1000)
      expect(account.statement).to eq(["date || credit || debit || balance\n11/08/2020 ||  1000  ||    ||  1000"])
    end
end