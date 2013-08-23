require 'test_datastructures'

class TestTreeNode < Test::Unit::TestCase

  context "TestTreeNode" do

    setup do
      @tree = DataStructures::TreeNode.new('grandmother')
    end

    should "be able to create a new instance" do
      @tree = DataStructures::TreeNode.new('')
    end

    should "begin empty" do
      assert @tree.empty?, "knows it's empty"
      assert @tree.child_count == 0, "0 children in empty tree"
      assert @tree.is_leaf?, "an empty tree is a leaf"
    end

    should "be able to add, recognise and remove children" do
      child = DataStructures::TreeNode.new('child')
      assert @tree.is_leaf?, "should start out as leaf"

      @tree.add_child child
      assert_equal @tree.child_count, 1, "child count should be 1"
      assert !@tree.is_leaf?, "should no longer be leaf"
      assert_equal @tree.children.first, child, "only child should be the one just added"

      @tree.remove_child! child
      assert_not_include @tree.children, child, "deleted child is forgotten by parent"
    end

    should "know its family tree" do 
      # make a happy family
      mother = DataStructures::TreeNode.new('the mother')
      daughter = DataStructures::TreeNode.new('the daughter')
      son = DataStructures::TreeNode.new('the son')
      mother.add_child daughter
      mother.add_child son
      uncle = DataStructures::TreeNode.new('the uncle')
      cousin = DataStructures::TreeNode.new('the cousin')
      uncle << cousin
      @tree << mother
      @tree << uncle

      assert_equal @tree.siblings, nil, "grandmother has no siblings :("

      [mother, daughter, son, uncle, cousin].each do |descendent|
        assert_include @tree.descendents, descendent, "should recognise #{descendent.data} as descendent"
      end

      assert_not_include mother.siblings, mother, "mother not her own sibling"
      assert_not_include son.siblings, son, "son not his own sibling"

      assert_equal uncle, mother.siblings.first, "mother sees uncle as sibling"
      assert_equal mother, uncle.siblings.first, "uncle sees mother as sibling"
      assert_equal son, daughter.siblings.first, "daughter sees son as sibling"
      assert_equal daughter, son.siblings.first, "son sees daughter as sibling"

      assert_equal daughter.parent, mother, "daughter recogises her own mother"
      assert_equal mother.parent, @tree, "mother knows grandmother is her mother"
      assert_equal cousin.parent.parent, @tree, "cousin recognises her own grandmother"

      assert son.is_leaf?
      assert !mother.is_leaf?
      assert !@tree.is_leaf?
      assert @tree.is_root?

      @tree.clear
      assert @tree.empty?
      assert @tree.is_leaf?
    end

  end # Tree context

end # TestTree
