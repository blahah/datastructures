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

    should "allow assignment and retrieval" do
      @ll << 'test'
      assert_equal 'test', @ll.first.data, 'single element is first'
      assert_equal 'test', @ll.last.data, 'single element is last'
      pp @ll.to_a

      @ll[1] = 'another test'
      pp @ll.to_a
      assert_equal 'another test', @ll[1], "indexed assignment and retrieval match"
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
        assert_equal a[3 - i], @ll.pop, "#{i}th item in shuld be #{3 - i}th in stack"
      end
    end

  end # LinkedList context

end # TestLinkedList