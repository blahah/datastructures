require 'test_datastructures'

class TestQueue < Test::Unit::TestCase

  context "Queue" do

    setup do
      @queue = DataStructures::Queue.new
    end

    should "be able to create a new instance" do
      @queue = DataStructures::Queue.new
    end

    should "begin empty" do
      assert @queue.empty?
      assert @queue.size == 0
    end

    should "raise an error on underflow" do
      assert_raise RuntimeError, "Queue underflow: nothing to dequeue" do
        @queue.dequeue
      end
    end

    should "stop being empty when first item added" do
      @queue.enqueue('first')
      assert !@queue.empty?
      assert @queue.size == 1
    end

    should "increment size on enqueueing" do
      @queue.enqueue('first')
      @queue.enqueue('second')
      assert @queue.size == 2
    end

    should "respond to size and length" do
      @queue.enqueue('first')
      assert @queue.size == @queue.length
    end

    should "have first item in at the front" do
      @queue.enqueue('first')
      @queue.enqueue('second')
      assert @queue.front == 'first'
    end

    should "have last item in at the back" do
      @queue.enqueue('first')
      @queue.enqueue('second')
      assert @queue.back == 'second'
    end

    should "return first in queue and get smaller on dequeueing" do
      @queue.enqueue('first')
      @queue.enqueue('second')
      assert @queue.dequeue == 'first'
      assert @queue.size == 1
    end

    should "have first and last items equal when length is one" do
      @queue.enqueue('first')
      assert @queue.size == 1
      assert @queue.front == @queue.back
    end

    should "become empty when last item dequeued" do
      @queue.enqueue('first')
      @queue.enqueue('second')
      2.times{ @queue.dequeue }
      assert @queue.size == 0
      assert @queue.empty?
    end

    should "become empty when cleared" do
      @queue.enqueue('first')
      @queue.enqueue('second')
      @queue.clear
      assert @queue.size == 0
      assert @queue.empty?
    end

  end # Queue context

end # TestQueue
