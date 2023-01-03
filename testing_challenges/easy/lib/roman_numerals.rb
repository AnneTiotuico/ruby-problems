=begin
input: integer
output: string representing roman numeral
rules:
- roman nums are written by expressing each digit separately starting from the left and skipping any digit with a value of zero

examples:
-certain numbers like 4 are represented by the 5 ('V') character with the 1 ('I') character to its left (IV); 9 is 10 ('X') with 1 ('I') to its left (IX)
-1990 is MCMXC
  - 1000 = M
  - 900 = CM (1000-100)
  - 90 = XC (100-)

- 2008 is MMVIII
  -2000 = MM
  -8 = VIII

data structures: integers, strings, hash, array?

algorithm:
-create a hash containing keys that are strings representing roman nums and values being their arabic num equivalent
-initialize result variable to empty string ''
-get the left most number and convert to roman using the ROMAN_NUMERALS hash constant
  -push that roman to `result`
-continue until we are finished converting the right most number
-return final `result`

=end

ROMAN_NUMERALS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

class RomanNumeral
  def initialize(num)
    @num = num
  end

  def to_roman
    result = ''
    current_num = num
    ROMAN_NUMERALS.each do |key, value|
      quotient, remainder = current_num.divmod(value)
      result << key * quotient if quotient > 0
      current_num = remainder
    end

    result
  end

  private
  attr_reader :num
end