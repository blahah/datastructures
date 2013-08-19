datastructures
==============

A collection of data structures in Ruby, made for my [data structures challenge](http://blahah.net/2013/08/18/algorithm-challenge)

## Day 1: Queue

```
require 'datastructure'
queue = DataStructures::Queue.new
queue.enqueue('first')
queue.enqueue('second')
queue.size # => 2
queue.empty? # => false
queue.front # => 'first'
queue.back # => 'second'
queue.dequeue # => 'first'
queue.dequeue # => 'second'
queue.dequeue # => RuntimeError, "Queue underflow: nothing to dequeue"
```