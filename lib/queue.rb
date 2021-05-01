class Queue
  BUFFER_SIZE = 20

  def initialize
    @store = Array.new(BUFFER_SIZE)
    @front = -1
    @back = -1
  end

  # O(1) to add and remove 
  def enqueue(element)
    if @front == -1
      @front = 0
      @back = 0
    elsif @back == @front
      raise ArgumentError.new("Queue is full")   
    end
    @store[@back] = element 
    @back = (@back + 1) % BUFFER_SIZE
  end

  # another solution
  # def enqueue(element)
  #   # queue is empty 
  #   if @front == -1
  #     @front = 0
  #     @back = 0
  #   elsif @front == 0 && @back == BUFFER_SIZE 
  #     raise ArgumentError.new("Queue is full")   
  #   elsif @back == BUFFER_SIZE # gone past the end of the array 
  #     @back = 0
  #   end
  #   @store[@back] = element 
  #   @back = @back + 1 
  # end

  def dequeue
    if (@front == -1)
      raise ArgumentError.new("Queue is empty")
    end 

    data = @store[@front]
    @store[@front] = nil 
    @front = (@front + 1) % BUFFER_SIZE

    if @front == @back # nothing left, empty
      @front = -1 
      @back = -1 
    end 
    return data 
  end

  # another solution
  # def dequeue
  #   if (@front == -1)
  #     raise ArgumentError.new("Queue is empty")
  #   end 

  #   data = @store[@front]
  #   @store[@front] = nil 
  #   @front = @front + 1 

  #   if @front == @back # nothing left in list 
  #     @front = -1 
  #     @back = -1 
  #   elsif @front == BUFFER_SIZE
  #     @front = 0
  #   end 
  #   return data 
  # end

  def front
    return @store[@front]
  end

  
  def size
    return 0 if @front == -1
    if @front < @back
      @back - @front 
    else
      BUFFER_SIZE - @front + @back 
    end
  end

  def empty?
    return @front == -1
  end

  def to_s
    arr = []
    current_index = @front 
    until current_index == @back 
      arr << @store[current_index]
      current_index = (current_index + 1) % @store.size 
    end
    return arr.to_s
  end
end
