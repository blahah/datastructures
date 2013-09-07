require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start

require 'test/unit'
begin; require 'turn/autorun'; rescue LoadError; end
require 'shoulda-context'
require 'datastructures'

Turn.config.format = :pretty
Turn.config.trace = 4

require 'set'

class GraphHelpers

  include Test::Unit::Assertions

  def run_index_handling_tests graph
    a = {
      1 => ['content 1', [2], [3]],
      2 => ['content 2', [3], [1]],
      3 => ['content 3', [1], [2]]
    }
    a.each_pair do |name, data|
      value, edges = data[0..1]
      graph.add(value, name, edges)
    end

    a.each_pair do |name, data|
      value, edges, edges2 = data
      edges += edges2
      edges = Set.new(edges)

      assert_equal value, graph.get_node_value(name), "node #{name} should know its value"
      assert_equal edges, graph.neighbours(name), "edges set should be in neighbours for node #{name}"
      assert graph.adjacent?(name, edges.first), "node #{name} is adjacent to neighbour"
    end

    graph.delete_edge(1, 2)
    assert_equal Set.new([3]), graph.neighbours(1), "deleting edge removes neighbour"
    assert !graph.adjacent?(1, 2), "deleting edge removes adjacency"
  end

  def run_node_manipulation_tests graph
    graph.add('test node', 1)

    assert_equal 'test node', graph.get_node_value(1), "node starts with assigned value"
    graph.set_node_value(1, 'changed value')
    assert_equal 'changed value', graph.get_node_value(1), "setting node value changes it"

    assert_equal Set.new([]), graph.neighbours(1), "node starts with no neighbours"
    graph.add_edge(1, 2)
    assert_equal Set.new([2]), graph.neighbours(1), "adding an edge makes target a neighbour"

    graph.delete(1)
    assert_raise NoMethodError, "accessing a deleted node throws an error" do
      graph.get_node_value(1)
    end
  end

  def self.test_traversal

  end

end