module DataStructures
  class Queue

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

    def enqueue item
      @array.push item
    end

    def dequeue
      raise "Queue underflow: nothing to dequeue." if self.size == 0
      @array.shift
    end

    def front
      @array.first
    end

    def back
      @array.last
    end

    def clear
      @array = Array.new
    end

  end
end