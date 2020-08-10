require 'account'

describe Account do
  describe 'Account' do
    it 'has an account' do
      expect(subject).to eq(subject)
    end
  end

  describe 'Balance' do
    it 'has a starting balance of 0' do
      expect(subject.current_balance).to eq(0)
    end
  end
end