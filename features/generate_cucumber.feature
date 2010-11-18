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
    And the file "features/support/env.rb" should contain "require 'bundler/setup'"
    And the file "Gemfile" should contain "gem 'cucumber'"
    And the file "Rakefile" should contain the cucumber tasks
    And the exit status should be 0
    
    @wip
    Scenario: Run `bddgen cucumber` in a project with an existing Gemfile
      Then it should ask to append to Gemfile
    
    @wip
    Scenario: Run `bddgen cucumber` in a project with an existing gemspec
      Then it should ask to add cucumber as development dependency
    
    @wip
    Scenario: Run `bddgen cucumber` in a project with an existing Rakefile
      Then it should add cucumber tasks
