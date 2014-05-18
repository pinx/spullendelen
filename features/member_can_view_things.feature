Feature: Member can view things
  In order to see things
  I can go visit the things overview page

  Background:
    Given I am signed in
    And there are things

  Scenario: List things
    When I go to the things list
    Then I should see things

  Scenario: List my own things
    When I go to my things
    Then I should see my things