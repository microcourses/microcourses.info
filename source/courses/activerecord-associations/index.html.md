---
title: ActiveRecord Associations
duration: 2 hours
stream: rails
layout: course
requirements:
  - ruby command, rails command
  - rails basics
  - spreadsheets basics
concepts:
  - relational database tables
  - foreign keys
  - ruby macros
  - object-relational mapping
challenge:
published: false
---

Relational databases store tables of information much like spreadsheets. For
example we could create a table to store people's favourite colours:

| user_id | name      | colour     |
| ----    | --------  | ---------  |
| 1       | Vera      | blue       |
| 2       | Chuck     | red        |
| 3       | Dave      | green      |

Pretty soon we realise that a person can like several colours. We *could* pack
more colours into that column, but a more elegant solution is to create a
new table and a `has_many` relationship between them.

| user_id | name      |
| ----    | --------  |
| 1       | Vera      |
| 2       | Chuck     |
| 3       | Dave      |

Now Vera can like green too:

| user_id | colour    |
| ----    | --------  |
| 1       | blue      |
| 1       | green     |
| 2       | red       |
| 3       | green     |

Run these commands at the command prompt:

```
rails new associations
cd associations
bundle
rails g model User name:string
rails g model Colour name:string user_id:integer
```

WIP :)
