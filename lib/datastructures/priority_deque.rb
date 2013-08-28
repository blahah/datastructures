module DataStructures

  # Implements priority deque
  class PriorityDeque < PriorityQueue

    def back_dequeue item
      @array.pop item.value
    end
    
  end # PriorityDeque

end # DataStructures