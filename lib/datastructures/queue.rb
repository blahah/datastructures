module DataStructures
  # Implements a simple FIFO (first in, first out) queue data
  # structure using an array container.
  class Queue

    # Return a new Queue
    def initialize
      self.clear
    end

    # Return the number of elements in the queue
    def size
      @array.size
    end

    alias :length :size

    # True if the queue is empty
    def empty?
      @array.empty?
    end

    # Add +:item+ to the back of the queue
    def enqueue item
      @array.push item
    end

    # Remove and return the item at the front of the queue
    def dequeue
      raise "Queue underflow: nothing to dequeue." if self.size == 0
      @array.shift
    end

    # Return the item at the front of the queue
    def front
      @array.first
    end

    # Return the item at the back of the queue
    def back
      @array.last
    end

    # Empty the queue
    def clear
      @array = Array.new
    end

  end
end