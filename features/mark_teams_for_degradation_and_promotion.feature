Feature: Mark teams for degradation & promotion
  In order to see which teams will promote
  As a competion fan
  I want to see which teams are marked for degradation

  Scenario: more then 6 teams in the competition and more then 1 game played
    Given a competition with more then 6 teams
    And two teams with two wins
    And two teams with one win
    When I list the competition
    Then the top 3 teams are marked for promotion
    And the bottom 3 teams are marked for degradation
    
  
  
