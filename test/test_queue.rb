require 'test_datastructures'

class TestQueue < Test::Unit::TestCase

  def test_queue

    # we can create a queue
    queue = DataStructures::Queue.new

    # should start empty
    assert queue.empty?
    assert queue.size == 0

    # underflow raises error
    assert_raise RuntimeError, "Queue underflow: nothing to dequeue" do
      queue.dequeue
    end

    # enqueueing increases size, removes emptiness
    queue.enqueue('first')
    assert !queue.empty?
    assert queue.size == 1

    # more enqueueing just increments size
    queue.enqueue('second')
    assert queue.size == 2

    # dequeueing returns first in, reduces size
    assert queue.dequeue == 'first'
    assert queue.size == 1

    # more dequeueing empties the queue
    assert queue.dequeue == 'second'
    assert queue.size == 0
    assert queue.empty?

    # trying to continue gives underflow
    assert_raise RuntimeError, "Queue underflow: nothing to dequeue" do
      queue.dequeue
    end

  end

end
