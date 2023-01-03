class CustomSet
  attr_reader :set

  def initialize(arr = [])
    @set = arr
  end

  def empty?
    set.empty?
  end

  def contains?(item)
    set.include?(item)
  end

  def subset?(other)
    return true if self.empty? && !other.empty?
    set.all? { |item| other.set.include?(item) }
  end

  def disjoint?(other)
    set.none? { |item| other.set.include?(item) }
  end

  def eql?(other)
    return false if set.empty? && !other.empty?
    set.uniq.all? { |item| other.set.uniq.include?(item) }
  end

  def ==(other)
    set == other.set
  end

  def add(item)
    set.include?(item) ? self : CustomSet.new(set << item)
  end

  def intersection(other)
    shared = set.intersection(other.set)
    CustomSet.new(shared)
  end

  def difference(other)
    differ = set.difference(other.set)
    CustomSet.new(differ)
  end

  def union(other)
    uni = set.union(other.set)
    CustomSet.new(uni.sort)
  end
end

#study group:

# class CustomSet
#   attr_reader :set

#   def initialize(arr = [])
#     @set = arr.uniq
#   end

#   def empty?
#     set.empty?
#   end

#   def contains?(int)
#     set.include?(int)
#   end

#   def subset?(other)
#     set.all? do |int|
#       other.contains?(int)
#     end
#   end

#   def disjoint?(other)
#     set.none? { |item| other.contains?(item) }
#   end

#   def eql?(other)
#     set.all? { |int| other.contains?(int) } && other.set.all? { |int| self.contains?(int) }
#   end

#   alias == eql?

#   def add(int)
#     set << int unless self.contains?(int)
#     self
#   end

#   def intersection(other)
#     new_arr = set.intersection(other.set)
#     CustomSet.new(new_arr)
#   end

#   def difference(other)
#     result = []
#     self.set.each do |int|
#       unless other.set.include?(int)
#         result << int
#       end
#     end
#     CustomSet.new(result)
#   end

#   def union(other)
#     new_set = set + other.set
#     CustomSet.new(new_set)
#   end
# end