def max_by(arr)
  max = nil
  index = 0
  values = []
  arr.each do |item|
    values << yield(item)
    max = yield(item)
  end
  values.each_with_index do |value, idx|
    if value > max
      max = value
      index = idx
    end
  end
  max = arr[index]
  max
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
