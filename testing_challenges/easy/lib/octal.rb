=begin
input: string
output: integer
rules:
-given an octal input string, convert it to a decimal output
-dont use any built-in or library methods
-decimal is base 10
  -The rightmost digit gets multiplied by 10^0 = 1
  -The next digit gets multiplied by 10^1 = 10
  -The digit after that gets multiplied by 10^2 = 100
  -The digit after that gets multiplied by 10^3 = 1000
  -...
  -The n*th* digit gets multiplied by 10^(n-1).
  -All of these values are then summed.
-octal numbers use powers of 8 rather than powers of 10
-invalid input should be treated as octal 0 which should return 0
-invalid input is anything other than the digits 0-7

examples:
-  233 # decimal
  = 2*10^2 + 3*10^1 + 3*10^0
  = 2*100  + 3*10   + 3*1

-  233 # octal
  = 2*8^2 + 3*8^1 + 3*8^0
  = 2*64  + 3*8   + 3*1
  = 128   + 24    + 3
  = 155

octal 1 = decimal 1 => 1*8^0 => 1 * 1
octal 10 = decimal 8 => 1*8^1 + 0*8^0 => 1 * 8 + 0 * 1 => 8 + 0
octal 130 = deicaml 88 => 1*8^2 + 3*8^1 + 0*8^0 => 64 + 24 + 0
octal 011 = decimal 9 => 1*8^1 + 1 * 8^0 => 8 + 1
  *ignore leading 0s

data structures: integers, strings, arrays

algorithm:
-convert the input string into an integer
-break up the integer into an array of `digits`
-iterate through the `digits` to convert each digit to power of 8 (map)
-sum up all the transofrmed values
=end

class Octal
  def initialize(str)
    @oct = str
  end

  def to_decimal
    return 0 unless valid_oct?
    digits = oct.to_i.digits
    digits.map.with_index { |digit, index| digit * (8 ** index) }.sum
  end

  private

  attr_reader :oct

  def valid_oct?
    true unless oct.match?(/[^0-7]/)
  end
end

