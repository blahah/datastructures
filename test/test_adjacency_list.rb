require 'test_datastructures'

class TestAdjacencyList < Test::Unit::TestCase

  context "AdjacencyList" do

    setup do
      @al = DataStructures::AdjacencyList.new
    end

    should "allow handling nodes by name" do
      @al = DataStructures::AdjacencyList.new(true)
      a = {
        :one => ['content 1', [:two]],
        :two => ['content 2', [:three]],
        :three => ['content 3', [:one]]
      }
      a.each_pair do |name, data|
        value, edges = data
        @al.add(value, name, edges)
      end

      a.each_pair do |name, data|
        value, edges = data

        assert_equal value, @al.get_node_value(name), "node #{name} should know its value"
        assert_equal @al.neighbours(name), edges, "edges set should be in neighbours for node #{name}"
        assert @al.adjacent?(name, edges.first), "node #{name} is adjacent to neighbour"
      end

      @al.delete_edge(:one, :two)
      assert_equal @al.neighbours(:one), [], "deleting edge removes neighbour"
      assert !@al.adjacent?(:one, :two), "deleting edge removes adjacency"
    end

    should "allow handling nodes by index" do
      a = {
        1 => ['content 1', [2]],
        2 => ['content 2', [3]],
        3 => ['content 3', [1]]
      }
      a.each_pair do |name, data|
        value, edges = data
        @al.add(value, name, edges)
      end

      a.each_pair do |name, data|
        value, edges = data

        assert_equal value, @al.get_node_value(name), "node #{name} should know its value"
        assert_equal @al.neighbours(name), edges, "edges set should be in neighbours for node #{name}"
        assert @al.adjacent?(name, edges.first), "node #{name} is adjacent to neighbour"
      end

      @al.delete_edge(1, 2)
      assert_equal @al.neighbours(1), [], "deleting edge removes neighbour"
      assert !@al.adjacent?(1, 2), "deleting edge removes adjacency"
    end

  end # AdjacencyList context

end # TestAdjacencyList