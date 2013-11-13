---
title: Functions
duration: 1 hour
stream: ruby
layout: course
requirements:
  - pen and paper
  - ruby command
concepts:
  - function stack
  - stack depth
  - stack unwinding
  - local variable scope
  - backtrace
challenge:
published: false
---

A function is a set of instructions grouped together and given a name that
indicates its purpose so that you can use it later. Although there are subtle
differences in definitions, they are also known as methods, procedures,
routines, subprocedures and subroutines.

Functions match quite well with the idea of tasks and subtasks when you are
planning a holiday. Each task uses more specific tasks to get the
whole job done.

```ruby
def plan_holiday
  book_flights
  book_hotel
end

def book_flights
  pick_destination
  compare_prices
  check calendar
  make_purchase
end

def book_hotel
  look_at_map
  compare_options
  make_booking
end
```

It is useful to understand what is going on by drawing the *function stack*.
This is how the computer stores what it was previously doing so that it can
come back to finish it off, once it has finished with a specific subtask.

                          +------------------+  +------------------+
                          | book_flights     |  | book_hotel       |
    +------------------+  +------------------+  +------------------+  +------------------+
    | plan_holiday     |  | plan_holiday     |  | plan_holiday     |  | plan_holiday     |
    +------------------+  +------------------+  +------------------+  +------------------+
           t = 0                 t = 1                 t = 2                 t = 3


```ruby
```
