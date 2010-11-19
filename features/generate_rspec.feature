Feature: Generate rspec
  In order to use rspec in my ruby project
  As a developer
  I want to generate the rspec boilerplate in my project
  
  Scenario: Run `bddgen rspec` in an empty project
    Given a current working directory named "myproject"
    When I run "bddgen rspec"
    Then the following files should be created:
      | spec/spec_helper.rb |
      | Gemfile             |
      | Rakefile            |
    And the file "spec/spec_helper.rb" should match the template "spec/spec_helper.rb"
    And the file "Gemfile" should contain "source 'http://rubygems.org'"
    And the file "Gemfile" should contain "gem 'rake'"
    And the file "Gemfile" should contain "gem 'rspec'"
    And the file "Rakefile" should contain the bundler setup
    And the file "Rakefile" should contain the rspec tasks
    And the exit status should be 0
    
    Scenario: Run `bddgen rspec` in a project with an existing Gemfile
      Given a current working directory named "myproject"
      And a file named "Gemfile" with:
        """
        source 'http://custom.com'
        gem 'special'
        """
      When I run "bddgen rspec"
      Then the file "Gemfile" should contain "source 'http://custom.com'"
      And the file "Gemfile" should contain "gem 'special'"
      And the file "Gemfile" should contain "gem 'rspec'"
      And the exit status should be 0

    Scenario: Run `bddgen rspec` in a project with an existing Rakefile
      Given a current working directory named "myproject"
      And a file named "Rakefile" with:
        """
        require 'custom'
        require 'special'
        """
      When I run "bddgen rspec"
      Then the file "Rakefile" should contain "require 'custom'"
      And the file "Rakefile" should contain "require 'special'"
      And the file "Rakefile" should contain the rspec tasks
      And the exit status should be 0

# TODO: consolodate the steps that check the boilerplate Gemfile init