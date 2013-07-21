Feature: Add a team to a competition

Scenario: add a team
  Given a valid competition
  When I add a team
  Then the team should be in the competition list


