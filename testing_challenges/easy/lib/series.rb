class Series
  def initialize(string)
    @string = string
  end

  def slices(int)
    raise ArgumentError unless valid_series?(int)

    result = []
    digits = @string.chars.map(&:to_i)
    digits.each_index do |index|
      result << digits[index, int] if digits[index, int].length == int
    end
    result
  end

  def valid_series?(int)
    @string.length >= int
  end
end
