class Stack
  def initialize
    @store = LinkedList.new
  end

  def push(element)
    @store.add_first(element)
  end

  def pop
    return nil if self.empty?
    item = @store.remove_first
    return item
  end

  # A Stack might also implement a peek method which returns,
  # but does not remove the item on top of the stack,
  # and size which would return the number of items on the stack.
  def peek
    return @store.get_first

    # return nil if @head.nil?
    # return @head.data
  end

  def size
    return @store.length 

    # return 0 if @store.head.nil? 
    # current = @store.head 
    # length = 0

    # while current 
    #   length += 1 
    #   current = current.next
    # end
    # return length 
  end

  def empty?
    return @store.empty?
  end

  def to_s
    return @store.to_s
  end
end
