module DataStructures
  # Implements a simple FIFO (first in, first out) queue data
  # structure using an array container.
  class TreeNode

    attr_accessor :children
    attr_accessor :parent
    attr_accessor :data

    def initialize(data,parent=nil)
      @data = data
      @parent = nil
      self.clear
    end

    def add_child child
      child.parent = self
      @children << child
    end

    def remove_child! child
      @children.delete child
    end

    alias :<< :add_child

    def child_count
      @children.size
    end

    def empty?
      @children.empty?
    end

    def is_leaf?
      @children.empty? ? true : false
    end

    def is_root?
      @parent.nil? ? true : false
    end

    def siblings
      if self.is_root?
        nil
      else
        @parent.children.reject { |sibling| sibling.equal? self }
      end
    end

    def descendents
      @children.map { |child| [child, child.descendents] }.flatten
    end

    def clear
      @children = Array.new
    end

  end # TreeNode

end # Biopsy