Feature: Add a team to a competition

Scenario: add a team and competition
  Given a valid competition
  When I add a team
  Then the team should be in the competition list

Scenario: add a team without a competition
  Given a valid competition
  When I add a team without a competition
  Then I should see error "can't be blank" on field "competition"
  And the team should not be in the competition list