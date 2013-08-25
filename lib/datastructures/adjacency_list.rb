module DataStructures

  # Implements an Adjacency list with integer-indexed nodes
  class AdjacencyList

    ALNode = Struct.new(:value)

    attr_accessor :edges

    # Returns a new AdjacencyList
    # Nodes are accessed with unique names if +:named+ is true,
    # otherwise they are accessed with integer indices (default).
    def initialize(named=false)
      @nodes = named ? [] : {}
      @edges = {}
    end

    # Assignment - adds a new node with +:value+, returning
    # self, so that assignments can be chained.
    def add(value, name=nil, edges)
      node = ALNode.new(value)
      @nodes << node
      @edges[node] = edges
      self
    end

    # Removal - deletes the node at +:nodeidentifier+, which should be
    # an integer index if this is an indexed adjacency list, or the name
    # of the node if this is a names adjacency list.
    def delete(nodeidentifier)
      node = @nodes[nodeidentifier]
      @nodes[nodeidentifier] = nil
      @edges.delete node
    end

    # Removal - deletes the edge(s) +:edges+ connected to +:node+.
    # +:node+ can be either the actual node to be modified, its index
    # (if this is an indexed list) or its name (is this is a named list)
    def delete_edge(node, *edges)
      node = @nodes[node] if node.class != ALNode
      alledges = @edges[node]
      edges.each { |edge| alledges.delete edge }
    end


    def get_node_value index

    end

    # Set with value of node at +:index+ to +:value+
    def set_node_value(index, value)

    end

    # Adds an edge from node with index +:x+ to node
    # with index +:y+.
    def add_edge(x, y)

    end

    def adjacent?(x, y)

    end

    def neighbours x

    end

  end
end