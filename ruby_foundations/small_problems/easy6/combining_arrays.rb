# def merge(arr1, arr2)
#   arr1.union(arr2)
# end

def merge(arr1, arr2)
  new_arr = arr1 + arr2
  new_arr.uniq!
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]