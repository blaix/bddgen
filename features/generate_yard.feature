Feature: Generate yard
  In order to use yard in my ruby project
  As a developer
  I want to generate the yard boilerplate
  
  Background:
    Given a current working directory named "myproject"
  
  Scenario: Run `bddgen yard` in an empty project
    When I run "bddgen yard"
    Then the following files should be created:
      | .gitignore |
    And the file ".gitignore" should contain "doc/*"
    And the file ".gitignore" should contain ".yardoc"
    And the file "Gemfile" should contain exactly:
      """
      source 'http://rubygems.org'
      
      gem 'rake'
      gem 'yard'
      
      """
    And the file "Rakefile" should contain the bundler setup
    And the file "Rakefile" should contain the yard task
    
  Scenario: Run `bddgen yard` in a project with an existing .gitignore
    Given a file named ".gitignore" with:
      """
      pkg/*
      tmp/*
      """
    When I run "bddgen yard"
    Then the file ".gitignore" should contain exactly:
      """
      pkg/*
      tmp/*
      doc/*
      .yardoc
      
      """
  
  Scenario: Run `bddgen yard` in a project with an existing Gemfile
    Given a file named "Gemfile" with:
      """
      source 'http://custom.com'
      gem 'special'
      """
    When I run "bddgen yard"
    Then the file "Gemfile" should contain exactly:
      """
      source 'http://custom.com'
      gem 'special'
      gem 'yard'
      
      """
  
  Scenario: Run `bddgen yard` in a project with an existing Rakefile
    Given a file named "Rakefile" with:
      """
      require 'custom'
      require 'special'
      """
    When I run "bddgen yard"
    Then the file "Rakefile" should contain "require 'custom'"
    And the file "Rakefile" should contain "require 'special'"
    And the file "Rakefile" should contain the yard task
