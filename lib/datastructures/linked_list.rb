module DataStructures
  # Implements a doubly Linked List.
  class LinkedList

    LLNode = Struct.new(:data, :next, :previous)

    attr_accessor :first
    attr_accessor :last
    attr_accessor :size

    alias :length :size

    # Returns a new LinkedList
    #
    # If no arguments are sent, the new LinkedList will be empty.
    # When one or more objects are sent as arguments, the LinkedList
    # is populated with those objects in the order sent.
    def initialize *entries
      if entries.nil?
        @size = 0
      else
        @size = entries.size
        @first = LLNode.new entries.shift
        entries.each { |entry| self.push entry }
        @last = entries.last
      end
    end

    # Returns true if the LinkedList is empty
    def empty?
      @size == 0
    end

    # Element Reference - Returns the element at +index+
    def [] index
      current = @first
      @size.times do |i|
        return current if i == index
        current = current.next
      end
    end

    # Element Assignment - Sets the element at +index+
    def []= data
      current = @first
      i = 0
      while !current.nil?
        return i if current.equal? node
        i += 1
      end
      nil
    end

    # Calls the given block once for each element in +self+, passing
    # that element as a parameter
    def each &block
      current = @first
      @size.times do
        yield current
        current = current.next
      end
    end

    # Append - Pushes the given object(s) on to the end of this
    # Linked List. The expression returns the list itself, so several
    # appends may be chained together. See also #pop for the opposite effect.
    def push *elements
      elements.each do |element|
        node = LLNode.new(element, nil, @last)
        @last.next = node
        @last = node
        @size += 1
      end
      self
    end

    # Removes the last element from +self+ and returns it.
    # Raises an underflow error if empty.
    def pop
      raise "Linked List underflow: nothing to pop." if self.size == 0
      last = @last
      @last = @last.previous
      @size -= 1
      last
    end

    # Prepends objects to the front of +self+, moving other elements
    # upwards. See also #shift for the opposite effect.
    def unshift *elements
      elements.each do |element|
        node = LLNode.new(element, @first, nil)
        @first.previous = node
        @first = node
        @size += 1
      end
      self
    end

    # Removes the first element of self and returns it (shifting all
    # other elements down by one. 
    def shift
      raise "Linked List underflow: nothing to shift." if self.size == 0
      first = @first
      @first = @first.next
      @size -= 1
      first
    end

    # Returns the index of +node+
    def index node
      current = @first
      i = 0
      while !current.nil?
        return i if current.equal? node
        i += 1
      end
      nil
    end

  end # LinkedList

end # Biopsy