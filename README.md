# For now, read the [wiki](https://github.com/microcourses/microcourses.info/wiki)

For lots more info, read this:
http://joshuapaling.com/post/rails-camp-micro-courses

There's already a plethora of resources for learning programming. However,
microcourses are very specific.

Especially in the early stages of this project, we want to hold tight to the
original goals and intention of microcourses, and maintain a narrow focus, to
avoid a mess.

## Microcourses in a nutshell

A microcourse is a self-contained, short (1-2 hr), hands-on, Rails-related
course, that can be done by a new to intermediate developer, with the
assistance of an experienced developer.

For now, microcourses should only teach Ruby on Rails web development and
directly related topics (eg. Git, Sass, CoffeeScript).

### The goal of microcourses

1. To allow friendships and informal mentoring relationships to organically
   form between newbies and advanced devs. This is the primary goal.
2. To teach practical aspects of Ruby on Rails web development in a hands-on,
   interactive way.

### Not the goal of microcourses

Initially, microcourses don't aim to provide a complete solution to learning
the whole Rails stack. Textbooks already provide that, and it would be too
ambitions a goal given the microcourse format & restrictions (more info further
down).

Initially, an event might only offer 5 or 6 microcourses, unrelated to each
other. This may change as we see how microcourses work in practice.

## Holding a microcourse

At a meetup like RailsCamp, Dev Hub, or Rails Girls, an experienced developer
would teach a microcourse to a small number (eg. 1 - 4) students. Rather than
holding a *microcourse*, you'd be holding a *microcourses session*. People
could choose which course they want to take / teach,and there might be several
different microcourses run at the same time.

## Restrictions of the environment

Since these events are free and / or relatively unstructured, people can't be
depended upon to commit or prepare in advance, or to follow up afterwards.
Ideally, people should be able to teach, or take, a microcourse, with little or
no preparation.

## Every microcourse should be...

* **Short:**. It (or at least a self-contained chunk of it) can be done in an
  hour or two.
* **Hands On:** Students should be *doing* not *listening*
* **Impromtuable**. It can be picked up by an intermediate to experienced dev,
  and taught impromptu, without little or no preparation.
* **Rails-Related:** It has some practical lesson, specific to web development
  with Ruby on Rails (Git, Sass, CoffeeScript are fair game. Chef, Linux,
Python, etc are probably not the focus for now).

### Ideally, a microcourse should also be:

* **Discrete / self-contained:** Minimal 'baggage' or dependencies in terms of
  prior experience / assumed knowledge / stuff to install.
* **Adaptable**. It can easily be adapted, on the fly, to varying levels of
  ability, from total coding beginner through to intermediate. (Intermediate
devs can wiz through or skip the easy steps)
* **Small-groupable**. It is suitable for a 1-1 environment, or a small group
  (eg. 2 - 4 people of relatively similar ability)
* **Pass-on-able**. Once a beginner has taken a microcourse, it would be
  awesome if they could teach, or at least assist in teaching, a future session
of that microcourse.
* **A4-pageable**. The basic microcourse curriculum (excluding code) should be
  printable on 1-2 sheets of A4 paper. It provides the outline, the teacher
fills in the detail ad hoc.

## Good and bad example microcourses

### Good 1: Coding a Ruby ATM

Small (1 Ruby class). Could be taught with no preparation. Easily adaptable to
student's ability. Eg - the most simple case might be to imagine an ATM with $5
notes only. Accept an amout to withrdaw, and return the number of $5 notes
required. As more requirements and / or restrictions are added, more complex
cases might require recursion, refactoring, and thought about writing
future-proof code.

### Good 2: Git fundamentals

Could be taught with no preparation. Easily adaptable - eg. cover things as
simple as basic commits, right up to interactive re-basing for more experienced
students. Very practical for Rails development. Self-contained (you could work
with a simple HelloWorld.txt file to keep the focus on Git and not on code).

### In between: An introduction to MVC

Important to know, and good for a talk. But mainly theoretical, not practical.
For it to be a microcourse, it would need to be explained in the most practical
manner.

### Bad 1: A 2-hours lecture in the benefits of garbage collection in memory management

Way too theoretical, way too premature, boring (given the audience).

### Bad 2: Building your own blog / todo / other small app

Great idea for a course, but bad for a microcourse. Will take longer than 2
hours. Covers a broad range of topics. Not focused enough.

## Contributing

We are always looking to improve and add to the microcourses. If you can write
a good support material, please, do.

Usual drill:

1. Fork
2. Create a Topic Branch
  * `bundle install` to fetch the gems
  * `middleman` to launch the development web server
  * visits `http://0.0.0.0:4567`
3. Send us a GitHub Pull Request

------------

This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 Unported License.
