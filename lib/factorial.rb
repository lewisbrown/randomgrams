module Factorial
  def fact
    (1..self).reduce(:*) || 1
  end
end