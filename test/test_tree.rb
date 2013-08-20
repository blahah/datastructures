require 'test_datastructures'

class TestTree < Test::Unit::TestCase

  context "Tree" do

    setup do
      @tree = DataStructures::Tree::Node.new
    end

    should "be able to create a new instance" do
      @tree = DataStructures::Tree::Node.new
    end

    should "begin empty" do
      assert @tree.empty?
      assert @tree.child_count == 0
    end

  end # Tree context

end # TestTree
