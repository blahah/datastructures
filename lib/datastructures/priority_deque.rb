module DataStructures

  # Implements priority deque
  class PriorityDeque < PriorityQueue

    # Return the item at the back of the queue (i.e., with the
    # lowest priority, removing it from the queue.
    def back_dequeue item
      @array.pop item.value
    end
    
  end # PriorityDeque

end # DataStructures