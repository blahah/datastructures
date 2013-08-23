require 'test_datastructures'

class TestStack < Test::Unit::TestCase

  context "Stack" do

    setup do
      @stack = DataStructures::Stack.new
    end

    should "be able to create a new instance" do
      @stack = DataStructures::Stack.new
    end

    should "begin empty" do
      assert @stack.empty?
      assert @stack.size == 0
    end

    should "raise an error on underflow" do
      assert_raise RuntimeError, "Stack underflow: nothing to pop" do
        @stack.pop
      end
    end

    should "stop being empty when first item added" do
      @stack.push('first')
      assert !@stack.empty?
      assert @stack.size == 1
    end

    should "increment size on pushing" do
      @stack.push('first')
      @stack.push('second')
      assert @stack.size == 2
    end

    should "respond to size and length" do
      @stack.push('first')
      assert @stack.size == @stack.length
    end

    should "have first item on the bottom" do
      @stack.push('first')
      @stack.push('second')
      assert @stack.bottom == 'first'
    end

    should "have last item in on the top" do
      @stack.push('first')
      @stack.push('second')
      assert @stack.top == 'second'
    end

    should "return top of stack and get smaller on popping" do
      @stack.push('first')
      @stack.push('second')
      assert @stack.pop == 'second'
      assert @stack.size == 1
    end

    should "have top and bottom items equal when length is one" do
      @stack.push('first')
      assert @stack.size == 1
      assert @stack.top == @stack.bottom
    end

    should "become empty when last item popped" do
      @stack.push('first')
      @stack.push('second')
      2.times{ @stack.pop }
      assert @stack.size == 0
      assert @stack.empty?
    end

    should "become empty when cleared" do
      @stack.push('first')
      @stack.push('second')
      @stack.clear
      assert @stack.size == 0
      assert @stack.empty?
    end

  end # Stack context

end # TestStack
