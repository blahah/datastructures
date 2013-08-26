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

    # Assignment - adds a new node with +:value+, and
    # +:nodeidentifier+, and optionally an array of
    # identifiers of other nodes defining +:edges+.
    # Returns self, so that assignments can be chained.
    def add(value, nodeidentifier, edges=[])
      node = ALNode.new(value)
      @nodes[nodeidentifier] = node
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

    # Returns the value of the node with +:nodeidentifier+
    def get_node_value nodeidentifier
      @nodes[nodeidentifier].value
    end

    # Set with value of node at +:nodeidentifier+ to +:value+
    def set_node_value(nodeidentifier, value)
      @nodes[nodeidentifier].value = value
    end

    # Adds an edge from node with identifier +:x+ to node
    # with identifier +:y+.
    def add_edge(x, y)
      @edges[@nodes[x]] << y
    end

    # True if +:x+ and +:y+ are connected by an edge.
    def adjacent?(x, y)
      @edges[@nodes[x]].include?(y) || @edges[@nodes[y]].include?(x)
    end

    # Return an array of identifiers of all nodes connected to 
    # +:x+ by edges.
    def neighbours x
      @edges[@nodes[x]]
    end

  end
end