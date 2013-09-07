require 'test_datastructures'

class TestAdjacencyMatrix < Test::Unit::TestCase

  context "AdjacencyMatrix" do

    setup do
      @am = DataStructures::AdjacencyMatrix.new 4
      @helper = GraphHelpers.new
    end

    should "allow handling nodes by index" do 
      @helper.run_index_handling_tests @am
    end

    should "allow node manipulation" do
      @helper.run_index_handling_tests @am
    end

  end # AdjacencyMatrix context

end # TestAdjacencyMatrix