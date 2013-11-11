---
title: Recursion
duration: 1 hour
stream: ruby
layout: course
requirements:
  - Pen and paper
  - Ruby
challenge: The (evil) government introduces 14 dollar notes. Update your program.
---

Functions have names that you can use to call them. A function can use its own
name to call itself. Such a function is called *recursive*. Today we will
implement a *backtracking* search algorithm using a *recursive function*.

Somebody wants you to build an ATM that gives a combination of 50 and 20 dollar
notes that sum to the requested number. If there is a choice, it gives bigger
notes rather than smaller notes (100 is two 50s, not five 20s).

These are the steps that a backtracking search will go through to give the person $70:

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
tests. Make all the tests pass!

```ruby
# Run this code with the command `ruby atm.rb -v`

def atm(number)
  if number <= 0             # no chance, buster
    []
  elsif number == 20
    [20]                     # OK, one 20 dollar note
  elsif number == 70
    [50] + atm(number - 50)  # a 50, plus whatever other notes
  else
    []                       # um...
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
