class Element
  attr_reader :datum, :reference

  def initialize(int, reference=nil)
    @datum = int
    @reference = reference
  end

  def tail?
    datum
  end

  def next
    reference
  end
end


class SimpleLinkedList
  attr_reader :list

  def initialize
    @list = []
  end

  def size
    list.size
  end

  def empty?
    list.empty?
  end

  def push(int)
    list << Element.new(int)
  end

  def peek
    list.last.datum unless list.last.nil?
  end

  def head
    list.first
  end
end