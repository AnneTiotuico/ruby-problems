def zip(arr1, arr2)
  new_arr = []
  arr1.each_with_index do |item1, idx1|
    arr2.each_with_index  do |item2, idx2|
      next if idx1 != idx2
      new_arr << [item1, item2]
    end
  end
  new_arr
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]