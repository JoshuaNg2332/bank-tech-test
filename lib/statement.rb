# frozen_string_literal: true

# Class for the Statement headers
class Statement

  def initialize
    @transactions = []
  end

  def headers
    "date || credit || debit || balance\n"
  end
end
