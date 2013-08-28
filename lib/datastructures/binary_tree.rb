module DataStructures

  class BinaryTreeNode < TreeNode

    attr_accessor :left_child
    attr_accessor :right_child

    # Set the left child of this node to +:child+
    def add_left_child child
      child.parent = self
      @left_child = child
    end

    # Remove the left child of this node
    def remove_left_child
      @left_child = nil
    end

    # Set the right child of this node to +:child+
    def add_right_child child
      child.parent = self
      @right_child = child
    end

    # Remove the right child of this node
    def remove_right_child
      @right_child = nil
    end

    undef_method :add_child
    undef_method :remove_child!

    # Return the number of direct children of this node
    def child_count
      self.children.reject { |c| c.nil? }.size
    end

    # True if this node is a leaf, i.e. has no children
    def is_leaf?
      @left_child.nil? && @right_child.nil?
    end

    # Return an array of all descendents
    def descendents
      self.children.map { |c| c.nil? ? [] : c.descendents }.flatten
    end

    # Def return an array of children
    def children
      [@left_child, @right_child]
    end

  end # BinaryTreeNode

end # DataStructures