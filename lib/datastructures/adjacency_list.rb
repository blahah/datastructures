module DataStructures

  # Implements an Adjacency list with indexed nodes
  class AdjacencyList

    ALNode = Struct.new(:value)

    attr_accessor :edges

    # Returns a new AdjacencyList
    # Nodes are accessed with unique names if +:named+ is true,
    # otherwise they are accessed with integer indices (default).
    def initialize(named=false)
      @nodes = {}
      @edges = {}
    end

    # Assignment - adds a new node with +:value+, and
    # +:nodeidentifier+, and optionally an array of
    # identifiers of other nodes defining +:edges+.
    # Returns self, so that assignments can be chained.
    def add(value, nodeidentifier, edges=Array.new)
      node = ALNode.new(value)
      @nodes[nodeidentifier] = node
      @edges[nodeidentifier] = edges
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

    # Removal - deletes the edge(s) +:edges+ connected to the node
    # referenced by +:nodeidentifer+.
    def delete_edge(nodeidentifier, *edges)
      alledges = @edges[nodeidentifier]
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
      @edges[x] << y
    end

    # True if +:x+ and +:y+ are connected by an edge.
    def adjacent?(x, y)
      @edges[x].include?(y) || @edges[y].include?(x)
    end

    # Return an array of identifiers of all nodes connected to 
    # node at +:nodeidentifier+ by edges.
    def neighbours nodeidentifier
      @edges[nodeidentifier]
    end

    # Return a string representation of the graph
    def to_s
      s = ""
      @nodes.each do |identifier, node|
        s += "#{identifier} (#{node.value}) => #{@edges[identifier]} \n"
      end
      s
    end

  end
end