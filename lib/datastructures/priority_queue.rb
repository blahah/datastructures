module DataStructures

  # Implements priority queue, in which elements can be inserted
  # with a priority that determines their position in the queue.
  class PriorityQueue < Queue

    PQNode = Struct.new(:value, :priority)

    # Add +:item+ to the queue with +:priority+.
    # +:priority+ must be an integer between 0 and queue.size
    def enqueue item, priority=0
      raise RangeError.new("priority #{priority} is greater than queue size") if priority > self.size
      @array.push PQNode.new(item, priority)
      @array.sort! { |a, b| a.priority <=> b.priority }
    end

    # Return the highest priority item in the queue, removing
    # it from the queue
    def dequeue
      r = super.dequeue
      r.nil? ? r : r.value
    end

    # Inspect the item at the front of the queue
    def front
      super.front.value
    end

    # Inspect the item at the back of the queue
    def back
      super.back.value
    end
    
  end # PriorityQueue

end # DataStructures