require 'statement'

describe Statement do

let(:statement) { Statement.new }

  describe 'Headers' do
    it 'can display the headers' do
      expect(statement.headers).to eq("date || credit || debit || balance\n")
    end
  end
end