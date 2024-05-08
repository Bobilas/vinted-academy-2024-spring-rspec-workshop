# Welcome!
This repository is a simple ruby on rails project to learn how to work with RSpec.

## Structure
We'll be working primarily with domain logic that has no tests covering it (yet!):
- `app/models/user.rb` (attributes: `name, is_verified`)
- `app/models/item.rb` (attributes: `name, user_id, price, is_sold, is_nsfw`)
- `app/domain/items/facade.rb`
  - `.items_for_sale` returns item ids that the given user has for sale
  - `.sold_items` returns item ids that the given user has sold
  - `.upload` uploads a new item for sale
  - `.sell` sells the given item
- `app/domain/items/nsfw_validator.rb`
  - `#nsfw?` returns whether the item is nsfw
  - `#validate` raises a validation error if the item is nsfw
- `app/domain/users/facade.rb`
  - `.register` registers a new user
  - `.verify` verifies an existing user
  - `.verified_user_ids` returns the ids of all verified users

## How to work with this repo?
It is quite simple - each exercise covers some features of RSpec, delving deeper with each step.
You can find each exercise in branches (work-in-progress):
- 01_describe_how_it_works
- 02_let
- 02_subject
- 04_factories
- 05_before
- 06_mocks_and_stubs
- 07_shared_contexts_and_examples
- 08_final

Each exercise builds on top of the previous one. After completing the exercise, check out the next branch -
it will contain a solution to the previous exercise (but maybe not before you've attempted it yourself),
and the next exercise will be prepared for you!

## Covered material
- https://thoughtbot.com/blog/four-phase-test the four-phase testing pattern: setup, exercise, verify, teardown
- https://rspec.info/documentation/ RSpec documentation
- https://rspec.info/features/3-13/rspec-core/example-groups/basic-structure/ describe and it
- https://rspec.info/features/3-13/rspec-expectations/ expectations and matchers
- https://rspec.info/features/3-13/rspec-core/subject/ subject
- https://rspec.info/features/3-13/rspec-core/helper-methods/let/ let and let!
- https://rspec.info/features/3-13/rspec-core/hooks/before-and-after-hooks/ before (and after)
- https://rspec.info/features/3-13/rspec-mocks/ mocking
- https://rspec.info/features/3-13/rspec-core/example-groups/shared-examples/ shared examples

## Cheat sheets
- https://devhints.io/rspec rspec
- https://devhints.io/factory_bot factories

## Additional resources
- https://rspec.info/documentation/ rspec documentation
- https://www.betterspecs.org/ best rspec practices
- https://github.com/thoughtbot/factory_bot/blob/main/GETTING_STARTED.md#defining-factories using factories
