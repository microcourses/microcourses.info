---
title: Coins
topics: one, two, three
duration: 2 hours
---

```ruby
#!/usr/bin/env ruby

# NOTES:
#
# The goal: How many ways can you make 75c out of nickels, dimes and quarters?
#
# You have unlimited nickels, dimes and quarters.
#
# This exercise is to introduce you to "recursion" - functions that call themselves.
#
# Some Ruby API knowledge you need to know for this:
#
# [1,2,3] + [4,5,6] evaluates to [1,2,3,4,5,6]
#
# [1,2,3].empty? evaluates to false
# [].empty? evaluates to true
#
# [[1,2,3], [4,5,6]] is called a nested array - an array where each item is an array
#
# A 'Set' works like the mathematical concept of a set. It is just like a Ruby array,
# but it enforces uniqueness and does not preserve the order of the things you put in it.
#
# x = Set.new # this makes a new set
# x.push(1) # this adds stuff to the set
# x.push(1)
# x.push(1)
# p x
#
# prints: #<Set: {1}>
#
# Ruby is good at guessing what you mean if you try to use + or - or == on sets.
#
# x = Set.new([1,2,3])
# y = Set.new([3,4,5])
# z = x + y
# p z
#
# prints: #<Set: {1, 2, 3, 4, 5}>
#
# Notice that the number 3 is not repeated.
#
# A set is handy here, because it ensures that the solution [5,5,10] is
# equivalent to the solution [10,5,5].

require 'set'

# This is a function that calls itself. It doesn't handle all cases yet. That
# is your job.
def coins(left_over, current_answer = Set.new)
  if left_over == 0
    if current_answer.empty? then
      return Set.new # no solutions
    else
      return Set.new([current_answer]) # one solution
    end

  elsif left_over == 5

    return coins(0, current_answer + [5]) # either an empty set, or a set with one solution

  elsif left_over == 10

    return coins(0, current_answer + [10]) + # either an empty set, or a set with one solution
      coins(5, current_answer + [5]) # more possible solutions

  elsif left_over == 15

    return coins(10, current_answer + [5]) + # either an empty set, or a set with one solution
      coins(5, current_answer + [10]) # more possible solutions

  else
    return [] # no solutions

  end
end

# ----------------------------------------------------------------------

require "minitest/spec"
require "minitest/autorun"
require "minitest/pride"

describe "coins" do
  [
    [0, 0],
    [5, 1],
    [10, 2],
    [15, 2],
    [20, 3],
    [25, 4],
    [30, 5],
    [75, 18],
  ].each do |input, expected|
    it "should provide #{expected} unique ways to make #{input} cents" do
      coins(input).map(&:sort).uniq.size.must_equal expected
    end
  end
end
```
