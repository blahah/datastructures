  module DataStructures

  class AdjacencyMatrix < AdjacencyList

    require 'extendmatrix'
    require 'set'

    AMNode = Struct.new(:value)

    # Returns a new AdjacencyMatrix with +:n+ nodes (default=2)
    def initialize n=2
      @matrix = Matrix.zero(n)
      @nodes = []
    end

    # Set the value of node +:n+ to +:value+
    def add(value, nodeidentifier, edges=Array.new)
      @nodes[nodeidentifier] = AMNode.new(value)
      edges.each { |e| self.add_edge(nodeidentifier, e) }
    end

    def delete nodeidentifier
      @nodes[nodeidentifier] = nil
    end

    def delete_edges_for_node nodeidentifier
      @matrix.row_size.times do |i|
        @matrix[nodeidentifier, i] = 0
        @matrix[i, nodeidentifier] = 0
      end
    end

    def size
      @nodes.size
    end

    alias :length :size

    def add_edge(x, y)
      @matrix[x, y] = 1
    end

    def delete_edge(x, y)
      @matrix[x, y] = 0
    end

    def adjacent?(x, y)
      @matrix[x, y] == 1 || @matrix[y, x] == 1
    end

    def edge_exists? x, y
      @matrix[x, y] == 1
    end

    def neighbours? x, y
      edge_exists?(x, y) || edge_exists?(y, x)
    end

    def neighbours nodeidentifier
      n = (0..self.size).reject do |i|
        !neighbours? nodeidentifier, i
      end
      Set.new(n)
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