module DataStructures
  # Implements a Tree data structure. TreeNode represents a single node,
  # and has methods for accessing parents, siblings and children.
  class TreeNode

    attr_accessor :children
    attr_accessor :parent
    attr_accessor :data

    # new TreeNode object.
    # +:data+ is the content of the node, can be any Ruby object
    # +:parent+ optionally specify the parent node. Must be a TreeNode. Not specifying a parent makes this a root node.
    def initialize(data,parent=nil)
      @data = data
      @parent = nil
      raise "parent must be a TreeNode" unless @parent.nil? || @parent.class == TreeNode
      self.clear
    end

    # add a child node.
    #+:child+ the node to add as a child. must be a TreeNode
    def add_child child
      child.parent = self
      @children << child
    end

    # remove a child node.
    #+:child+ the child node to remove. must be a TreeNode
    def remove_child! child
      @children.delete child
    end

    alias :<< :add_child

    # count the direct children of this node
    def child_count
      @children.size
    end

    # true if the node is a leaf, i.e. has no children
    def is_leaf?
      @children.empty?
    end

    alias :empty? :is_leaf?

    # true if this node is root, i.e. has no parent
    def is_root?
      @parent.nil?
    end

    # return an array of the siblings of this node. Nil if root.
    def siblings
      if self.is_root?
        nil
      else
        @parent.children.reject { |sibling| sibling.equal? self }
      end
    end

    # return an array of all descendents
    def descendents
      @children.map { |child| [child, child.descendents] }.flatten
    end

    # remove all children
    def clear
      @children = Array.new
    end

  end # TreeNode

end # Biopsy