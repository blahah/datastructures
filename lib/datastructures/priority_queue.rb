module DataStructures

  # Implements priority queue, in which elements can be inserted
  # with a priority that determines their position in the queue.
  class PriorityQueue < Queue

    PQNode = Struct.new(:value, :priority)

    # Add +:item+ to the queue with +:priority+.
    # +:priority+ must be an integer between 0 and queue.size
    def enqueue item, priority
      raise RangeError.new("priority #{priority} is greater than queue size") if priority > self.size
      @array.push PQNode.new(item, priority)
      @array.sort! { |a, b| a.priority <=> b.priority }
    end

    def dequeue
      r = super.dequeue
      r.nil? ? r : r.value
    end

    def front
      super.front.value
    end

    def back
      super.back.value
    end
    
  end # PriorityQueue

end # DataStructures