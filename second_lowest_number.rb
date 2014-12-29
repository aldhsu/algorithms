class SecondLowestNumber
  attr_accessor :digits, :break_point, :swap_index
  # #1. Find highest index swap
  # #2. Find lowest number at index

  def initialize(integer)
    @digits = integer.to_s
    @break_point =  -1 # where to stop looking and where to swap
    @swap_index = nil # where to swap from
  end

  def find_swap_index(index_of_number)
    number = digits[index_of_number]

    result = nil
    index_of_number.downto(break_point).each do |index|
      if digits[index] < number
        result = index
        break
      end
    end

    if result
      if result > break_point || (result == break_point && (!swap_index || digits[index_of_number] < digits[swap_index]))
        @break_point = result
        @swap_index = index_of_number
      end
    end
  end

  def next_intagram
    enum = (digits.length-1).downto(0).each

    while (current_index = enum.next) > break_point
      find_swap_index(current_index)
    end

    return_number

  rescue StopIteration
    raise "No smaller integer next"
  end

  def return_number
    @digits[break_point], @digits[swap_index] = @digits[swap_index], @digits[break_point]
    sorted_after = @digits[(break_point + 1)..-1].chars.sort.join("")
    "#{@digits[0..break_point]}#{sorted_after}".to_i
  end
end
