Feature: Get version
  In order to know what version of the command I have installed
  I want to run a task that gives me the version
  
  Scenario Outline: Version options
    When I run "bddgen <option>"
    Then I should see the current version number
    
    Examples:
      | option    |
      | -v        |
      | -V        |
      | --version |
      | version   |
