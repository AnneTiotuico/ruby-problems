def drop_while(arr)
  arr.each_with_index do |item, idx|
    next if yield(item)
    return arr[idx..-1]
  end
  []
end

# Copy Code
p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
# This line in the examples is not a typo:

# Copy Code
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
