require 'test_datastructures'

class TestAdjacencyList < Test::Unit::TestCase

  context "AdjacencyList" do

    setup do
      @al = DataStructures::AdjacencyList.new
      @helper = GraphHelpers.new
    end

    should "allow handling nodes by name" do
      @al = DataStructures::AdjacencyList.new(true)
      a = {
        :one => ['content 1', [:two], [:three]],
        :two => ['content 2', [:three], [:one]],
        :three => ['content 3', [:one], [:two]]
      }
      a.each_pair do |name, data|
        value, edges, ignore = data
        @al.add(value, name, edges)
      end

      a.each_pair do |name, data|
        value, edges, edges2 = data
        edges += edges2
        edges = Set.new(edges)

        assert_equal value, @al.get_node_value(name), "node #{name} should know its value"
        assert_equal edges, @al.neighbours(name), "edges set should be in neighbours for node #{name}"
        assert @al.adjacent?(name, edges.first), "node #{name} is adjacent to neighbour"
      end

      @al.delete_edge(:one, :two)
      assert_equal Set.new([:three]), @al.neighbours(:one), "deleting edge removes neighbour"
      assert !@al.adjacent?(:one, :two), "deleting edge removes adjacency"
    end

    should "allow handling nodes by index" do 
      @helper.run_index_handling_tests @al
    end

    should "allow node manipulation" do
      @helper.run_index_handling_tests @al
    end

  end # AdjacencyList context

end # TestAdjacencyList