module DataStructures
  # Implements a simple FILO (first in, last out) stack data
  # structure using an array container.
  class Stack

    # Return a new Stack
    def initialize
      self.clear
    end

    # Return the number of elements in the stack
    def size
      @array.size
    end

    alias :length :size

    # True if the stack is empty
    def empty?
      @array.empty?
    end

    # Add +:item+ to the top of the stack
    def push item
      @array.push item
    end

    # Remove and return the top item in the stack
    def pop
      raise "Stack underflow: nothing to pop." if self.size == 0
      @array.pop
    end

    # Return the top item in the stack
    def top
      @array.last
    end

    # Return the bottom item in the stack
    def bottom
      @array.first
    end

    # Empty the stack
    def clear
      @array = Array.new
    end

  end
end