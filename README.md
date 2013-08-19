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
[coveralls]: https://coveralls.io/repo/Blahah/datastructures

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
