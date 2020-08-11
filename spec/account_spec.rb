require 'account'

describe Account do

  let(:account) { Account.new }

  describe 'Account' do
    it 'has an account' do
      expect(account).to eq(account)
    end
  end

  describe 'Balance' do
    it 'has a starting balance of 0' do
      expect(account.current_balance).to eq(0)
    end
  end

  describe 'Deposit' do
    it 'adds 100 to the balance' do
      account.deposit(100)
      expect(account.current_balance).to eq(100)
    end
  end

end