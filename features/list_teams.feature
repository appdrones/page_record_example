Feature: List teams
  In order to get an overview of the standings
  As a competition fan
  I want list all teams based on rankings

  Scenario: List all teams in order of standing
		Given a competition with more then 6 teams
		When I list the competition
		Then I should see 6 teams in the order of the number of points


  
