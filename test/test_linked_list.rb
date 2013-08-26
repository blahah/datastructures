require 'test_datastructures'

class TestLinkedList < Test::Unit::TestCase

  context "LinkedList" do

    setup do
      @ll = DataStructures::LinkedList.new
    end

    should "start empty" do
      assert @ll.empty?, "should start empty"
      assert_equal [].to_s, @ll.to_s, "string representation of empty list matches empty array"
    end

    should "be able to create with a single element" do
      @ll = DataStructures::LinkedList.new('test')
      assert_equal 1, @ll.size, "should have size 1 after adding 1"
    end

    should "be able to create with multiple elements" do
      @ll = DataStructures::LinkedList.new(1,2,3,4)
      assert_equal 4, @ll.size, "should have size 4 after adding 4"
    end

    should "allow enumeration with a block" do
      a = [1, 2, 3, 4]
      @ll = DataStructures::LinkedList.new(*a)
      i = 0
      @ll.each do |value|
        assert_equal a[i], value, "enumeration elements at #{i} should match"
        i += 1
      end
    end

    should "allow assignment, insertion, retrieval and deletion" do
      @ll << 'test'
      assert_equal 'test', @ll.first.data, 'single element is first'
      assert_equal 'test', @ll.last.data, 'single element is last'

      @ll[1] = 'another test'
      @ll[3] = 'yet another'
      assert_equal 'another test', @ll[1], "indexed assignment and retrieval match"
      
      assert_equal 0, @ll.index('test'), "correct index gets returned for pushed item"
      assert_equal 1, @ll.index('another test'), "correct index gets returned for assigned item"
      assert @ll[2].nil?, "assignment > highest index should fill in with nil"

      @ll[2] = 'replacement'
      assert_equal 'replacement', @ll[2], "filled-in nils can be replaced with values"

      @ll.insert(1, 'inserted data')
      assert_equal @ll[1], 'inserted data', "insertion set the value at index"
      assert_equal @ll[2], 'another test', "insertion moves existing values along"

      @ll.delete(2)
      assert_equal 'replacement', @ll[2], 'deletion moves subsequent elements back one'
    end

    should "allow chained assignment" do 
      @ll.push(1).push(2).push(3).push(4)
      assert_equal [1,2,3,4], @ll.to_a
    end

    should "act as a queue" do
      a = [1, 2, 3, 4]
      @ll.push(*a)
      4.times do |i|
        assert_equal a[i], @ll.shift, "#{i}th item in should be #{i}th in queue"
      end
    end

    should "act as a stack" do
      a = [1, 2, 3, 4]
      @ll.push(*a)
      4.times do |i|
        assert_equal a[3 - i], @ll.pop, "#{i}th item in should be #{3 - i}th in stack"
      end
    end

    should "act as an inverse stack" do
      a = [1, 2, 3, 4]
      @ll.unshift(*a)
      4.times do |i|
        assert_equal a[3 - i], @ll.shift, "#{i}th item in should be #{3 - i}th in inverse stack"
      end
    end

    should "fail to find index for non-contained data" do
      @ll.push(1,2,3,4)
      assert @ll.index(5).nil?, "index should be nil when data not found"
    end

  end # LinkedList context

end # TestLinkedList