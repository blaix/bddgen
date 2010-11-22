Feature: Generate project
  In order to quickly bootstrap a new ruby project
  As a developer
  I want to generate a new ruby project with all the boilerplate I need
  
  Scenario: Run `bddgen project myproject`
    When I run "bddgen project myproject"
    Then the output should say the following files were created:
      | myproject        |
      | .gitignore       |
      | CHANGELOG        |
      | Gemfile          |
      | lib/myproject.rb |
      | Rakefile         |
      | README.markdown  |
    And the following files should exist:
      | myproject/.gitignore       |
      | myproject/CHANGELOG        |
      | myproject/Gemfile          |
      | myproject/lib/myproject.rb |
      | myproject/Rakefile         |
      | myproject/README.markdown  |
    And a directory named "myproject/lib/myproject" should exist
    And the file "myproject/lib/myproject.rb" should contain exactly:
      """
      module Myproject
      end
      
      """
    And the exit status should be 0
