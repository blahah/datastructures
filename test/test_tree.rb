require 'test_datastructures'

class TestTreeNode < Test::Unit::TestCase

  context "TestTreeNode" do

    setup do
      @tree = DataStructures::TreeNode.new('test')
    end

    should "be able to create a new instance" do
      @tree = DataStructures::TreeNode.new('')
    end

    should "begin empty" do
      assert @tree.empty?
      assert @tree.child_count == 0
    end

  end # Tree context

end # TestTree
