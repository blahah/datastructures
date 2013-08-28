module DataStructures

  class BinaryTreeNode < TreeNode

    attr_accessor :left_child
    attr_accessor :right_child

    def add_left_child child
      child.parent = self
      @left_child = child
    end

    def remove_left_child
      @left_child = nil
    end

    def add_right_child child
      child.parent = self
      @right_child = child
    end

    def remove_right_child
      @right_child = nil
    end

    undef_method :add_child
    undef_method :remove_child!

    def child_count
      [@left_child, @right_child].reject { |child| child.nil? }.size
    end

  end # BinaryTreeNode

end # DataStructures