class SecondLowestNumber
  attr_accessor :digits, :break_point, :swap_index
  # #1. Find highest index swap
  # #2. Find lowest number at index

  def initialize(integer)
    @digits = integer.to_s
    @break_point = 0 # where to stop looking and where to swap
    @swap_index = nil # where to swap from
  end

  def find_swap_index(index_of_number)
    number = digits[index_of_number]

    result = (digits.length - 1).downto(break_point).each do |index|
      break index if digits[index] < number
    end

    if result 
      if result > break_point || (result == break_point && (swap_index.nil? || digits[result] < digits[swap_index]))
        @break_point = result
        @lowest_index = digits[index_of_number]
        return break_point
      end
    else
      return nil
    end
  end

  def find
    enum = (digits.length-1).downto(0).each

    while (current_index = enum.next) != break_point
      find_swap_index(current_index)
    end

    return_number
  rescue StopIteration
    raise "No smaller integer next"
  end

  def return_number
    @digits[break_point], @digits[swap_index] = @digits[swap_index], @digits[break_point]
    @digits
  end
end
