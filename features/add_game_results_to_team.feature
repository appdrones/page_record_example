Feature: Add a game result to the competition
  In order to get a current ranking of teams
  As a competion fan
  I want to add a game result to the competition

Background:
	Given a home team in the competition
	And a visiting team in the competition

Scenario: Add a win for the home team
	When the home team wins
	Then I should see 3 points added to the home team score
	And I should see 0 points added to the visiting team score
	And I should see an increment in the number of games for the home team
	And I should see an increment in the number of games for the visiting team

Scenario: Add a win for the visiting team
	When the visiting team wins
	Then I should see 3 points added to the visiting team score
	And I should see 0 points added to the home team score
	And I should see an increment in the number of games for the home team
	And I should see an increment in the number of games for the visiting team


  
