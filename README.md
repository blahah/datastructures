datastructures
==============

A collection of data structures in Ruby, made for my [data structures challenge](http://blahah.net/2013/08/18/algorithm-challenge)

[![Gem Version](https://badge.fury.io/rb/datastructures.png)][gem]
[![Build Status](https://secure.travis-ci.org/blahah/datastructures.png?branch=master)][travis]
[![Dependency Status](https://gemnasium.com/blahah/datastructures.png?travis)][gemnasium]
[![Code Climate](https://codeclimate.com/github/blahah/datastructures.png)][codeclimate]
[![Coverage Status](https://coveralls.io/repos/blahah/datastructures/badge.png?branch=master)][coveralls]

[gem]: https://badge.fury.io/rb/datastructures
[travis]: http://travis-ci.org/blahah/datastructures
[gemnasium]: https://gemnasium.com/blahah/datastructures
[codeclimate]: https://codeclimate.com/github/blahah/datastructures
[coveralls]: https://coveralls.io/repo/blahah/datastructures

## Day 1: Queue

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
