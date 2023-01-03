=begin
input: number
output: string
rules:
-natural nums can be classified as abundant, perfect, or deficient based on
comparing the number and its positive divisors
-15 has positive divisors 1 3 and 5, and the sum of these 3 nums is its aliquot sum
-perfect numbers have an aliquot sum that is equal to the original num
-abundant numbers have an aliquot sum that is greater than the original num
-deficient numbers have an aliquot sum that is less than the original num
-the num itself isn't considered its divisor

examples:
- 6 is a perfect number since its divisors are 1, 2, and 3,
  and 1 + 2 + 3 = 6.
- 28 is a perfect number since its divisors are 1, 2, 4, 7, and 14
  and 1 + 2 + 4 + 7 + 14 = 28.
- 15 is a deficient number since its divisors are 1, 3, and 5
  and 1 + 3 + 5 = 9 which is less than 15.
- 24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12
  and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.
- Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.

data structures: exception, integer, string, range?

algorithm:
-initialize aliquot_nums = []
-iterate through a range 1 up to but not including num |n|
  - check if num % n == 0, if it is, add it to `aliquot_nums`
-check if sum of `aliquot_nums` is greater, equal,
  or less than num to determine category


=end

class PerfectNumber
  def self.classify(num)
    raise StandardError if num < 1
    aliquot_sum = divisors(num).sum
    if aliquot_sum > num
      "abundant"
    elsif aliquot_sum < num
      "deficient"
    else
      "perfect"
    end
  end

  def self.divisors(num)
  (1...num).each_with_object([]) do |n, divisors|
      divisors << n if num % n == 0
    end
  end
end