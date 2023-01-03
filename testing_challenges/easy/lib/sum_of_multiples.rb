=begin
input: digits
output: digit
rules:
-given a num and a set of nums, find the sum of all the multiples of the numbers in the
set that are less tahn the first num, if no set of nums is given, default to 3 and 5
-given 1, return 0, since it is too small a number to have multiples of 3 or 5

examples:
given 20 and no set of nums, the multiples are
3, 5, 6, 9, 10, 12, 15, and 18 which sums up to 78

given 4 and no set of nums, multiples are
3 which sums up to 3

given 10 and no set of nums, the multiples are
3, 5, 6 and 9 which sums up to 23

given 20 with set of 7, 13, and 17, the multiples are
7, 13, 14, and 17 which sums up to 51

given 15 with set of 4 and 6, the multiples are
4, 6, 8, and 12 which sums up to 30

algorithm:
-create a constructor that sets default set_of_nums to (3, 5)
-create a #to class and instance method that takes an integer
-initialize an empty array `multiples` = []
-create a range 3..given integer
  -iterate through this range |int|
  -shovel `int` if multiple of any of the `set_of_nums`
-sum up `multiples`

=end

class SumOfMultiples
  def initialize(*nums)
    @set_of_nums = nums
  end

  def self.to(num)
    SumOfMultiples.new.to(num)
  end

  def to(num)
    (3...num).reduce(0) { |acc, int| is_multiple?(int) ? acc + int : acc }
  end

  private

  attr_reader :set_of_nums

  def is_multiple?(int)
    if set_of_nums.empty?
      [3, 5].any? { |num| int % num == 0 }
    else
      set_of_nums.any? { |num| int % num == 0 }
    end
  end
end
