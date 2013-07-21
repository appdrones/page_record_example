Feature: Mark teams for promotion
  In order to see which teams will promote
  As a competion fan
  I want to see which teams are marked for promotion

  Scenario: more then 6 teams in the competition and more then 1 game played
    Given a competition with more then 6 teams
    And a competion round has been entered
    When I list the teams
    Then the top 3 teams are marked for promotion
  
  Scenario: more then 6 teams in the competition and less then 1 game played
    Given a competition with more then 6 teams
    When I list the teams
    Then no teams are marked for promotion
