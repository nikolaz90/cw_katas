# frozen_string_literal: true

class Array
  def valid?
    flatten.sort == (1..9).to_a
  end
end
