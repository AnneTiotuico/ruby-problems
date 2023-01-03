def each_with_index(arr)
  index = 0
  arr.each do |item|
    yield(item, index)
    index += 1
  end
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
# should output:

# Copy Code
# 0 -> 1
# 1 -> 3
# 2 -> 36
# true