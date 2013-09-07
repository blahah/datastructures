  module DataStructures

  class AdjacencyMatrix < AdjacencyList

    require 'extendmatrix'
    require 'set'

    AMNode = Struct.new(:value)

    # true if this is a directed graph. 
    attr_reader :directed

    # Returns a new AdjacencyMatrix with +:n+ nodes (default=2)
    def initialize n=2, directed=true
      @matrix = Matrix.zero(n)
      @nodes = []
      @directed = directed
    end

    # Set the value of node +:n+ to +:value+
    def add(value, nodeidentifier, edges=Array.new)
      @nodes[nodeidentifier] = AMNode.new(value)
      edges.each { |e| self.add_edge(nodeidentifier, e) }
    end

    def delete nodeidentifier
      @nodes[nodeidentifier] = nil
    end

    # delete edges associated with the node +:nodeidentifier+
    def delete_edges_for_node nodeidentifier
      @matrix.row_size.times do |i|
        @matrix[nodeidentifier, i] = 0
        @matrix[i, nodeidentifier] = 0
      end
    end

    # return the number of nodes in the graph
    def size
      @nodes.size
    end

    alias :length :size

    # add an edge +:x+ -> +:y+. if the graph is
    # undirected, the edge will be symmetric.
    def add_edge(x, y)
      @matrix[x, y] = 1
      @matrix[y, x] = 1 unless @directed
    end

    # delete the edhe +:x+ -> +:y+. if the graph
    # is undirected, the symmetric edge is deleted.
    def delete_edge(x, y)
      @matrix[x, y] = 0
      @matrix[y, x] = 0 unless @directed
    end

    # true if the nodes +:x+ and +:y+ are connected
    # by an edge in either direction.
    def adjacent?(x, y)
      @matrix[x, y] == 1 || @matrix[y, x] == 1
    end

    # true if an edge +:x+ -> +:y+ exists.
    # If the graph is undirected, true is returned
    # if either x -> y or y -> x exists.
    def edge_exists? x, y
      @directed ? (@matrix[x, y] == 1 || @matrix[y, x] == 1) : (@matrix[x, y] == 1)
    end

    # true if an edge in either direction connects
    # +:x+ and +:y+.
    def neighbours? x, y
      edge_exists?(x, y) || edge_exists?(y, x)
    end

    # return a Set of nodes neighbouring +:nodeidentifier+.
    def neighbours nodeidentifier
      n = (0..self.size).reject do |i|
        !neighbours? nodeidentifier, i
      end
      Set.new(n)
    end

    # true if a path exists between +:x+ -> +:y+
    # this method takes advantage of the mathematical
    # fact that in an adjacency matrix where self-connections
    # are allowed, a path from x -> y exists in matrix A with
    # N nodes if A^(N-1) > 0.
    def path_exists? x, y
      (@matrix ** (self.size - 1))[x, y] > 0
    end

    # returns the number of paths from +:x+ to +:y+
    # in +:hops+.
    def count_paths_with_hops x, y, hops
      (@matrix ** hops)[x, y]
    end

    def to_s
      s = ""
      @nodes.reject{ |n| n.nil? }.each do |identifier, node|
        edges = @matrix.column(identifier).each_with_index
        edges.reject{ |e, i| !e }.map { |e, i| i }
        s += "#{identifier} (#{node.value}) => #{edges} \n"
      end
      s
    end

  end # AdjacencyMatrix

end # DataStructures