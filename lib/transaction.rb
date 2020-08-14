class Transaction

  attr_reader :date, :amount, :current_balance, :type

  def initialize(amount, current_balance, type)
    @date = DateTime.now.strftime '%d/%m/%Y'
    @amount = amount
    @current_balance = current_balance
    @type = type
  end

  def self.create(amount, current_balance, type)
    Transaction.new(amount, current_balance, type)
  end
end