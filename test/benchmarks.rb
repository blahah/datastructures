require_relative 'test_datastructures'
require 'benchmark'

iterations = 1_000_000

Benchmark.bmbm(7) do |bm|
  bm.report('Queue enqueue') do
    q = DataStructures::Queue.new
    iterations.times do |i|
      q.enqueue i
    end
  end

  bm.report('LinkedList push') do
    ll = DataStructures::LinkedList.new
    iterations.times do |i|
      ll.push i
    end
  end

  bm.report('Stack push') do
    s = DataStructures::Stack.new
    iterations.times do |i|
      s.push i
    end
  end

  bm.report('Tree add child') do
    currentnode = DataStructures::TreeNode.new('0')
    iterations.times do |i|
      c = DataStructures::TreeNode.new(i)
      currentnode.add_child(c)
      currentnode = c
    end
  end
end