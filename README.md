# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
ruby 3.3.0 (2023-12-25 revision 5124f9ac75) [arm64-darwin23]

* System dependencies
PostgresSQL

* Configuration
image resize:
brew install libpq
brew link --force libpq
brew install imagemagick
brew install vips

rich_text:
rails action_text:install

* Database creation
rails db:create

* Database initialization
rails db:migrate

* How to run the test suite
rails test

* Services (job queues, cache servers, search engines, etc.)
Storage
 - dev: .local

* Deployment instructions

* ...
