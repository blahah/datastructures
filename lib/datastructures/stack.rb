module DataStructures
  # Implements a simple FILO (first in, last out) stack data
  # structure using an array container.
  class Stack

    def initialize
      self.clear
    end

    def size
      @array.size
    end

    alias :length :size

    def empty?
      @array.empty?
    end

    def push item
      @array.push item
    end

    def pop
      raise "Stack underflow: nothing to pop." if self.size == 0
      @array.pop
    end

    def top
      @array.last
    end

    def bottom
      @array.first
    end

    def clear
      @array = Array.new
    end

  end
end