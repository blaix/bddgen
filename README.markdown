# BDDGen

Generate all the boilerplate for using [Cucumber](http://cukes.info) and
[RSpec](https://github.com/rspec/rspec) in a new ruby project.

Keep in mind this is intended for plain vanilla ruby projects. If you're
writing a rails app or something, there are probably generators better
suited for the job.

## Installation

The usual:

    $ gem install bddgen
    
## Usage

In your project's root directory...

### Cucumber

    $ bddgen cucumber

This will create a `features` skeleton, add the `cucumber` gem to your
`Gemfile`, and set up your `Rakefile` with the following tasks:

    rake features         # Run Cucumber features
    rake features:pretty  # Run Cucumber features with output in pretty format
    rake features:wip     # Run @wip (Work In Progress) Cucumber features

### Rspec

    $ bddgen rspec
    
This will create a `spec` directory with a `spec_helper.rb`, add the `rspec`
gem to your `Gemfile`, and set up your `Rakefile` with the following tasks:

    rake spec             # Run specs
    rake spec:doc         # Run specs with output in documentation format

If you don't already have a `Gemfile` or `Rakefile`, one will be created.

## TODO

* `bddgen yard`
* `bddgen project --cucumber --rspec --yard`
* Add `--mock_framework=mocha` option to rspec generator.
* Add destroy tasks
* Add development dependency if a gemspec exists.
* Don't assume use of bundler...?
