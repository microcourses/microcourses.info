---
title: Recursion
duration: 2 hours
stream: ruby
layout: course
requirements:
  - pen and paper
  - ruby command
concepts:
  - function stack
  - stack depth
  - stack unwinding
  - local variable storage
  - base case
  - recursive case
challenge: The (evil) government introduces 14 dollar notes. Update your program.
---

Once a function is defined, it can be called using its name. A *recursive
function* calls itself using its own name. Today you will use such a function
to build an ATM that is stocked with 50 and 20 dollar notes.

These are the steps a backtracking search goes through to give somebody $70:

| step  | notes     | remainder  | solution?  |
| ----  | --------  | ---------  | ---------  |
| 1     | -         | 70         | no         |
| 2     | 50        | 20         | no         |
| 3     | 50,20     | 0          | yes        |

These are the steps for $80:

| step  | notes        | remainder  | solution?  |
| ----  | --------     | ---------  | ---------  |
| 1     | -            | 80         | no         |
| 2     | 50           | 30         | no         |
| 3     | 50,20        | 10         | no         |
| 4     | 20           | 50         | no         |
| 5     | 20,50        | 10         | no         |
| 6     | 20,20        | 40         | no         |
| 7     | 20,20,20     | 20         | no         |
| 8     | 20,20,20,20  | 0          | yes        |

The code below is a partial solution with some passing tests and some failing
tests. Copy this code into a file named `atm.rb` and run it with the command
`ruby atm.rb -v`. Make all the tests pass!

```ruby

def atm(number)
  if number <= 0             # no chance, buster (base case)
    []
  elsif number == 20
    [20]                     # OK fine, one 20 dollar note (base case)
  elsif number == 70
    [50] + atm(number - 50)  # a 50, plus whatever other notes (recursive case)
  else
    []                       # not sure, what do you think?
  end
end

require 'minitest/spec'
require 'minitest/autorun'

describe 'atm' do
  [
    [  0,  [] ],
    [  70, [50, 20] ],
    [  80, [20, 20, 20, 20] ],
    [ 100, [50, 50] ],
    [ 101, [] ],
  ].each do |input, expected|
    it "should convert the number #{input} to #{expected}" do
      atm(input).must_equal expected
    end
  end
end
```
