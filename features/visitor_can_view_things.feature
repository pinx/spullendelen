Feature: Visitor can view things
  In order to see things
  I can visit the things overview page

  Background:
    Given I am not signed in
    And there are things

  Scenario: List things
    When I go to the things list
    Then I should see things
    And I should not see owners
