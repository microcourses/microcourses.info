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

A function lets us **reuse** code. It is a set of instructions grouped together
and given a name that indicates its purpose so that you can use it later via
its name.

Although there are subtle differences in definitions, they are also known as
methods, procedures, routines, subprocedures and subroutines.

Functions match quite well with the idea of tasks and subtasks when you are
planning a holiday. Each task uses more specific tasks to get the whole job
done.

```ruby
# a very simple ruby holiday

def plan_holiday
  book_flights
  book_hotel
end

def book_flights
  pick_destination
  buy_tickets
end

def book_hotel
  look_at_map
  book_room
end
```

It is useful to understand what is going on by drawing the **function stack**.
The computer keeps track (in its memory) methodically of what it was doing so
that it can come back to it once it has finished with a subtask. Computer
scientists sometimes draw it just like a stack of plates that grows and
shrinks. In each case, the current task is the one on the top of the stack.

    #######################################################################################

                                                +------------------+
                                                | pick_destination |
                          +------------------+  +------------------+  +------------------+
                          | book_flights     |  | book_flights     |  | book_flights     |
    +------------------+  +------------------+  +------------------+  +------------------+
    | plan_holiday     |  | plan_holiday     |  | plan_holiday     |  | plan_holiday     |
    +------------------+  +------------------+  +------------------+  +------------------+
           t = 1                 t = 2                 t = 3                 t = 4

    #######################################################################################

    +------------------+
    | buy_tickets      |
    +------------------+  +------------------+                        +------------------+
    | book_flights     |  | book_flights     |                        | book_hotel       |
    +------------------+  +------------------+  +------------------+  +------------------+
    | plan_holiday     |  | plan_holiday     |  | plan_holiday     |  | plan_holiday     |
    +------------------+  +------------------+  +------------------+  +------------------+
           t = 5                 t = 6                 t = 7                 t = 8

    #######################################################################################

    +------------------+                        +------------------+
    | look_at_map      |                        | book_room        |
    +------------------+  +------------------+  +------------------+  +------------------+
    | book_hotel       |  | book_hotel       |  | book_hotel       |  | book_hotel       |
    +------------------+  +------------------+  +------------------+  +------------------+
    | plan_holiday     |  | plan_holiday     |  | plan_holiday     |  | plan_holiday     |
    +------------------+  +------------------+  +------------------+  +------------------+
          t = 9                 t = 10                t = 11                t = 12

    #######################################################################################




    +------------------+
    | plan_holiday     |
    +------------------+
          t = 13

### Exercise

Change this code so that there are no duplicated sets of steps.

```ruby
# TODO
```
