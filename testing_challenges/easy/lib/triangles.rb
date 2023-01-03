class Triangle
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    @side1 = side1
    @side2 = side2
    @side3 = side3
    raise ArgumentError unless valid_lengths?
  end

  def kind
    unique_sides = @sides.uniq
    return 'equilateral' if unique_sides.length == 1
    return 'isosceles' if unique_sides.length == 2

    'scalene'
  end

  def valid_lengths?
    @sides.combination(2) do |pair|
      return false unless @sides.all? { |side| side < pair.sum } && @sides.all?(&:positive?)
    end
    true
  end
end