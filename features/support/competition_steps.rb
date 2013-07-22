Given(/^a valid competition$/) do
	@competition = "Eredivisie"
end

When(/^I add a team$/) do
	visit new_team_path
	team = TeamPage.find
	team.name = "Ajax"
	team.competition = @competition
	team.save
end

Then(/^the team should be in the competition list$/) do
	visit teams_path
	all_teams = TeamPage.all.collect { |team| team.name}
	expect(all_teams).to include('Ajax')
end

Given(/^a competition with more then (\d+) teams$/) do |number_of_teams|
	number_of_teams.to_i.times { create(:team) }
end

When(/^I list the competition$/) do
	visit teams_path
end

Then(/^I should see (\d+) teams in the order of the number of points$/) do |number_of_teams|
	expect(TeamPage.all.size).to eq number_of_teams.to_i
end


Given(/^a home team in the competition$/) do
	@home_team = create :team
	@home_team_points = 0
	@home_team_games = 0
end

Given(/^a visiting team in the competition$/) do
	@visiting_team = create :team
	@visiting_team_points = 0
	@visiting_team_games = 0
end

When(/^the home team wins$/) do
	pending
end

Then(/^I should see (\d+) points added to the home team score$/) do |extra_points|
	visit teams_path
	home_team = TeamPage.find_by_name(@home_team.name)
	expect(home_team.points.to_i).to eq @home_team_points + extra_points.to_i
end

Then(/^I should see (\d+) points added to the visiting team score$/) do |extra_points|
	visit teams_path
	visiting_team = TeamPage.find_by_name(@visiting_team.name)
	expect(visiting_team.points.to_i).to eq @visiting_team_points + extra_points.to_i
end

Then(/^I should see an increment in the number of games for the home team$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see an increment in the number of games for the visiting team$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^the visiting team wins$/) do
	visit new_game_path
	game = GamePage.find
	game.visiting_team_id = @visiting_team.name
	game.home_team_id = @home_team.name
	game.game_date = '2013-10-10'
	game.goals_home_team = 1
	game.goals_visiting_team = 2
	game.save
end
