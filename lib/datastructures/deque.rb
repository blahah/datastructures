module DataStructures

  # Implements a queue in which elements can be removed and added
  # at both the front and back, using an array container.
  class Deque < Queue

    def front_enqueue item
      @array.unshift item
    end

    def back_dequeue item
      @array.pop item
    end

  end # Deque

end # DataStructures