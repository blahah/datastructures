module DataStructures

  # Implements a queue in which elements can be removed and added
  # at both the front and back, using an array container.
  class Deque < Queue

    # Add +:item: to the front of the queue
    def front_enqueue item
      @array.unshift item
    end

    # Return the item at the back of the queue, removing
    # it from the queue
    def back_dequeue item
      @array.pop item
    end

  end # Deque

end # DataStructures