# BDDGen

Generate all the boilerplate for using [Cucumber](http://cukes.info) and
[RSpec](https://github.com/rspec/rspec) in a new ruby project.

Keep in mind this is intended for plain vanilla ruby projects. If you're
writing a rails app or something, there are probably generators better
suited for the job.

Also keep in mind: **This is so alpha.** Use at your own risk. Until at
least version 1, you can't use the excuse "bddgen ate my homework!" because
*I am warning you right now that might happen*.

## Installation

The usual:

    $ gem install bddgen
    
## Usage

In your project's root directory...

### Cucumber

    $ bddgen cucumber

This will create a `features` directory with all the files you need to hit the
ground running, add the `cucumber` gem to your `Gemfile`, and set up your
`Rakefile` with the following tasks:

    rake features         # Run Cucumber features
    rake features:pretty  # Run Cucumber features with output in pretty format
    rake features:wip     # Run @wip (Work In Progress) Cucumber features

If you don't already have a `Gemfile` or `Rakefile`, one will be created.

### Rspec

    $ bddgen rspec
    
This will create a `spec` directory with a `spec_helper.rb`, add the `rspec`
gem to your `Gemfile`, and set up your `Rakefile` with the following tasks:

    rake spec             # Run specs
    rake spec:doc         # Run specs with output in documentation format

If you don't already have a `Gemfile` or `Rakefile`, one will be created.

### For added convenience, you can also set up [yard](http://yardoc.org/):

    $ bddgen yard

This will add `doc/*` and `.yardoc` to your `.gitignore`, add the `yard` gem
to your Gemfile, and set up a `yard` rake task.

If you don't already have a `Gemfile`, `Rakefile`, or `.gitignore`, one will
be created.

### From scratch:

Build an entirely new project from scratch with:

    $ bddgen project name
    
Where `name` is the name of your new project.

## TODO

* Further document `bddgen project`
* support `bddgen project` options: `--cucumber`, `--rspec`, and `--yard`
* `bddgen project` should ask if/how to create a `LICENSE` file
* Add `--mock_framework=mocha` option to rspec generator.
* Add destroy tasks
* Add development dependency if a gemspec exists.
* Don't assume use of bundler...?
