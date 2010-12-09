Feature: Generate project
  In order to quickly bootstrap a new ruby project
  As a developer
  I want to generate a new ruby project with all the boilerplate I need
  
  Scenario: Run `bddgen project myproject`
    When I run "bddgen project myproject"
    Then the output should say the following files were created:
      | myproject                |
      | .gitignore               |
      | CHANGELOG                |
      | Gemfile                  |
      | lib/myproject.rb         |
      | lib/myproject/version.rb |
      | Rakefile                 |
      | README.markdown          |
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
    And the file "myproject/lib/myproject/version.rb" should contain exactly:
      """
      module Myproject
        VERSION = "0.0.1"
      end
      
      """

  Scenario: Run `bddgen project myproject --cucumber`
    When I run "bddgen project myproject --cucumber"
    Then the output should say the following files were created:
      | features/step_definitions/myproject_steps.rb |
      | features/support/env.rb                      |
      | features/support/helpers.rb                  |
    And the following files should exist:
      | myproject/features/step_definitions/myproject_steps.rb |
      | myproject/features/support/env.rb                      |
      | myproject/features/support/helpers.rb                  |
    And the file "myproject/Gemfile" should contain "gem 'cucumber'"
    And the file "myproject/Rakefile" should contain the cucumber tasks

  Scenario: Run `bddgen project myproject --rspec`
    When I run "bddgen project myproject --rspec"
    Then the output should say the following files were created:
      | spec/spec_helper.rb |
    And the following files should exist:
      | myproject/spec/spec_helper.rb |
    And the file "myproject/Gemfile" should contain "gem 'rspec'"
    And the file "myproject/Rakefile" should contain the rspec tasks

  Scenario: Run `bddgen project myproject --yard`
    When I run "bddgen project myproject --yard"
    Then the file "myproject/Gemfile" should contain "gem 'yard'"
    And the file "myproject/Rakefile" should contain the yard task for "myproject"

  Scenario: Run `bddgen project myproject --cucumber --rspec --yard`
    When I run "bddgen project myproject --cucumber --rspec --yard"
    Then the output should say the following files were created:
      | features/step_definitions/myproject_steps.rb |
      | features/support/env.rb                      |
      | features/support/helpers.rb                  |
      | spec/spec_helper.rb                          |
    And the following files should exist:
      | myproject/features/step_definitions/myproject_steps.rb |
      | myproject/features/support/env.rb                      |
      | myproject/features/support/helpers.rb                  |
      | myproject/spec/spec_helper.rb                          |
    And the file "myproject/Gemfile" should contain "gem 'cucumber'"
    And the file "myproject/Gemfile" should contain "gem 'rspec'"
    And the file "myproject/Gemfile" should contain "gem 'yard'"
    And the file "myproject/Rakefile" should contain the cucumber tasks
    And the file "myproject/Rakefile" should contain the rspec tasks
    And the file "myproject/Rakefile" should contain the yard task for "myproject"
