# BDDGen

Generate all the boilerplate for using [Cucumber](http://cukes.info) in a new
ruby project.

Keep in mind this is intended for plain vanilla ruby projects. If you're
writing a rails app or something, there are probably already generators better
suited for what you're trying to do.

## Installation

The usual:

    $ gem install bddgen
    
## Usage

    $ cd project_name
    $ bddgen cucumber

This will create a `features` skeleton, a `Gemfile` that requires `cucumber`,
and a `Rakefile` with the following tasks:

    rake features         # Run Cucumber features
    rake features:pretty  # Run Cucumber features with output in pretty format
    rake features:wip     # Run @wip (Work In Progress) Cucumber features

## TODO

* Offer to append to Gemfile and Rakefile if they already exist.
* Add development dependency if a gemspec exists.
* Don't assume use of bundler...?
* bddgen rspec
* bddgen yard (maybe?)
* bddgen project (definitely)
