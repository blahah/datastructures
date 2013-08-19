datastructures
==============

A collection of data structures in Ruby, made for my [data structures challenge](http://blahah.net/2013/08/18/algorithm-challenge)

[![Gem Version](https://badge.fury.io/rb/datastructures.png)][gem]
[![Build Status](https://secure.travis-ci.org/Blahah/datastructures.png?branch=master)][travis]
[![Dependency Status](https://gemnasium.com/Blahah/datastructures.png?travis)][gemnasium]
[![Code Climate](https://codeclimate.com/github/Blahah/datastructures.png)][codeclimate]
[![Coverage Status](https://coveralls.io/repos/Blahah/datastructures/badge.png?branch=master)][coveralls]

[gem]: https://badge.fury.io/rb/datastructures
[travis]: https://travis-ci.org/Blahah/datastructures
[gemnasium]: https://gemnasium.com/Blahah/datastructures
[codeclimate]: https://codeclimate.com/github/Blahah/datastructures
[coveralls]: https://coveralls.io/r/Blahah/datastructures

## Installation

`gem install datastructures`

## Day 1: Queue

A queue is a simple container-based structure that mimics a real-life queue (e.g. waiting in line at the bank). It is FIFO (first-in-first-out), meaning that when you retrieve items from the queue, they are returned in the order in which they entered. Ruby Arrays provide methods that make Queue implementation trivially easy, but having them named appropriately and contained in a convenience class is worth it to see how they are implemented, and because other structures will inherit from this one. An alternate implementation could be done using a linked list.

Usage:

```ruby
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

## Day 2: Stack

The stack is the sibling of the queue. It mimicks a real-life stack (e.g. of paper). It is FILO (first-in-last-out), so that when items are retrieved from the stack, they are returned in the reverse of the order in which they were added. Again, Ruby Arrays provide a perfect container. As with the Queue, it could also be implemented using a linked list.

Usage:

```ruby
require 'datastructure'
stack = DataStructures::Stack.new
stack.push('first')
stack.push('second')
stack.size # => 2
stack.empty? # => false
stack.top # => 'second'
stack.bottom # => 'first'
stack.pop # => 'second'
stack.pop # => 'first'
stack.pop # => RuntimeError, "Stack underflow: nothing to pop"
```