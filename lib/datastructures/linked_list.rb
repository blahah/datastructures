module DataStructures
  # Implements a doubly Linked List.
  class LinkedList

    require 'pp'

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
      @size = 0
      unless entries.empty?
        @first = LLNode.new(entries.shift, nil, nil)
        @last = @first
        @size = 1
        self.push(*entries) unless entries.empty?
      end
    end

    # Returns true if the LinkedList is empty
    def empty?
      @size == 0
    end

    # Element Reference - Returns the element at +index+
    def [] index
      current = @first
      index.times do
        current = current.next
      end
      current.data
    end

    # Element Assignment - Sets the element at +index+ to
    # +:data+
    def []= index, data
      if index > @size - 1
        # fill in the gaps
        ((index - @size) + 1).times do
          self.push nil
        end
        @last.data = data
      else
        # replace existing value
        current = @first
        index.times do
          current = current.next
        end
        current.data = data
      end
      self
    end

    # Insert a node with +:data+ at +:index+.
    # All nodes +:index+ and above get moved along one.
    def insert index, data
      old_node = @first 
      index.times do
        old_node = old_node.next
      end
      new_node = LLNode.new(data, old_node, old_node.previous)
      old_node.previous.next = new_node
      old_node.previous = new_node
      self
    end

    # Delete the node at +:index+
    def delete index
      current = @first
      index.times do
        current = current.next
      end
      current.previous.next = current.next
      current.next.previous = current.previous
    end

    # Calls the given block once for each element in +self+, passing
    # that element as a parameter
    def each &block
      current = @first
      @size.times do
        yield current.data
        current = current.next
      end
    end

    # Append - Pushes the given object(s) on to the end of this
    # Linked List. The expression returns the list itself, so several
    # appends may be chained together. See also #pop for the opposite effect.
    def push *elements
      elements.each do |element|
        node = LLNode.new(element, nil, @last)
        @first = node if @first.nil?
        @last.next = node unless @last.nil?
        @last = node
        @size += 1
      end
      self
    end

    alias :<< :push

    # Removes the last element from +self+ and returns it.
    # Raises an underflow error if empty.
    def pop
      raise "Linked List underflow: nothing to pop." if self.size == 0
      last = @last
      @last = @last.previous
      @size -= 1
      last.data
    end

    # Prepends objects to the front of +self+, moving other elements
    # upwards. See also #shift for the opposite effect.
    def unshift *elements
      elements.each do |element|
        node = LLNode.new(element, @first, nil)
        @last = node if @last.nil?
        @first.previous = node unless @first.nil?
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
      first.data
    end

    # Returns the first index equal to +data+ (using == comparison).
    # Counts from the beginning of the list.
    def index data
      current = @first
      i = 0
      while !current.nil?
        return i if current.data == data
        current = current.next
        i += 1
      end
      nil
    end

    # Returns an array containing the data from the nodes in the list
    def to_a
      current = @first
      array = []
      while !current.nil?
        array << current.data
        current = current.next
      end
      array
    end

    # Returns a string representation of the list
    def to_s
      self.to_a.to_s
    end

  end # LinkedList

end # Biopsy

ll = DataStructures::LinkedList.new(*[1,2,3])
