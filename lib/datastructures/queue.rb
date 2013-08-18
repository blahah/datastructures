module DataStructures
  class Queue

    def initialize
      self.clear
    end

    def size
      @array.size
    end

    alias_method :size, :length

    def empty?
      @array.empty?
    end

    def enqueue item
      @array.push item
    end

    def dequeue
      raise "Queue underflow: nothing to dequeue."
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