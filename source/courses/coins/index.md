---
title: Program a recursive function
topics:
  - recursion
  - sets
  - arrays
duration: 2 hours
pupil_level: beginner
stream: ruby
layout: course
credit_question: Adjust your solution because somebody just invented 20c coins.
---

The goal: How many ways can you make 75c out of nickels, dimes and quarters?

Two example solutions are `(25, 25, 25)` and `(25, 25, 10, 10, 5)`. You have
unlimited nickels (5), dimes (10) and quarters (25). Find all the solutions.

### Useful Ruby knowledge

Functions can call themselves. This is concept is called recursion.

This is a nested array:

````ruby
[[1,2,3], [4,5,6]]
```

Ruby gives you lots of ways to work with arrays, such as:

```ruby
[1,2,3] + [4,5,6] # [1,2,3,4,5,6]
[1,2,3].empty?    # false
[].empty?         # true
```

A `Set` works like the mathematical concept of a set. It is just like a Ruby array,
but it enforces uniqueness and does not preserve the order of the things you put in it.

```ruby
require 'set'
x = Set.new # => #<Set: {}>
x.push(1)   # => #<Set: {1}>
x.push(1)   # => #<Set: {1}>
x.push(1)   # => #<Set: {1}>
x.push(2)   # => #<Set: {1, 2}>
```

In Ruby, you can treat sets much like arrays.

```ruby
x = Set.new([1,2,3])   # => #<Set: {1, 2, 3}>
y = Set.new([3,4,5])   # => #<Set: {3, 4, 5}>
z = x + y              # => #<Set: {1, 2, 3, 4, 5}>
```

Notice that the number 3 is not repeated in the result. Thanks, set.

A set is handy here, because it ensures that the solution `(5,5,10)` is
equivalent to the solution `(10,5,5)`.

Run with the command `ruby coins.rb -v`

```ruby
def coins(target, collection = [])
  p target: target, collection: collection
  if target == 0
    [collection.sort]             # only one solution (base case)
  elsif target == 5
    coins(0, collection + [5])    # the current collection + 5c
  elsif target == 10
    coins(0, collection + [10]) + # the current collection + 10c
      coins(5, collection + [5])  # the current collection + 5c
  else
    []                            # no solutions
  end
end

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
