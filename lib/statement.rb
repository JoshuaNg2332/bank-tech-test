# frozen_string_literal: true

# Class for the Statement headers
class Statement

  def headers
    "date || credit || debit || balance\n"
  end

  def self.print(transactions)
    puts "date || credit || debit || balance\n"
    transactions.each do |transaction|
      if is_credit?(transaction)
        puts "#{transaction.date} ||    ||  #{'%.2f' % transaction.amount}  ||  #{'%.2f' % transaction.current_balance}"
      else
        puts "#{transaction.date} ||  #{'%.2f' % transaction.amount}  ||    ||  #{'%.2f' % transaction.current_balance}"
      end
    end
  end

  def self.is_credit?(transaction)
    true if transaction.type
  end
end
