Feature: Generate cucumber
  In order to use cucumber in my ruby project
  As a developer
  I want to generate the cucumber boilerplate in my project
  
  Scenario: Run `bddgen cucumber` in an empty project
    Given a current working directory named "myproject"
    When I run "bddgen cucumber"
    Then the following files should be created:
      | features/support/env.rb                      |
      | features/step_definitions/myproject_steps.rb |
      | Gemfile                                      |
      | Rakefile                                     |
    And the file "features/support/env.rb" should match the template "features/support/env.rb"
    And the file "Gemfile" should contain "source 'http://rubygems.org'"
    And the file "Gemfile" should contain "gem 'rake'"
    And the file "Gemfile" should contain "gem 'cucumber'"
    And the file "Rakefile" should contain the bundler setup
    And the file "Rakefile" should contain the cucumber tasks
    And the exit status should be 0
    
    Scenario: Run `bddgen cucumber` in a project with an existing Gemfile
      Given a current working directory named "myproject"
      And a file named "Gemfile" with:
        """
        source 'http://custom.com'
        gem 'special'
        """
      When I run "bddgen cucumber"
      Then the file "Gemfile" should contain "source 'http://custom.com'"
      And the file "Gemfile" should contain "gem 'special'"
      And the file "Gemfile" should contain "gem 'cucumber'"
      And the exit status should be 0

    Scenario: Run `bddgen cucumber` in a project with an existing Rakefile
      Given a current working directory named "myproject"
      And a file named "Rakefile" with:
        """
        require 'custom'
        require 'special'
        """
      When I run "bddgen cucumber"
      Then the file "Rakefile" should contain "require 'custom'"
      And the file "Rakefile" should contain "require 'special'"
      And the file "Rakefile" should contain the cucumber tasks
      And the exit status should be 0
      
# TODO: consolodate the steps that check the boilerplate Gemfile init