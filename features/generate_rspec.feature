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
    And the file "Gemfile" should contain exactly:
      """
      source 'http://rubygems.org'
      
      gem 'rake'
      gem 'rspec'
      
      """
    And the file "Rakefile" should contain the bundler setup
    And the file "Rakefile" should contain the rspec tasks
    
    Scenario: Run `bddgen rspec` in a project with an existing Gemfile
      Given a current working directory named "myproject"
      And a file named "Gemfile" with:
        """
        source 'http://custom.com'
        gem 'special'
        """
      When I run "bddgen rspec"
      Then the file "Gemfile" should contain exactly:
        """
        source 'http://custom.com'
        gem 'special'
        gem 'rspec'
        
        """

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
