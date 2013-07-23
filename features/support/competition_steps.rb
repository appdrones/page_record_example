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
	scores = TeamPage.all.collect { |t| t.points}
	expect(scores).to be_ordered_descending
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
	visit teams_path
	home_team = TeamPage.find_by_name(@home_team.name)
	expect(home_team.number_of_games.to_i).to eq @home_team_games + 1
end

Then(/^I should see an increment in the number of games for the visiting team$/) do
	visit teams_path
	visiting_team = TeamPage.find_by_name(@visiting_team.name)
	expect(visiting_team.number_of_games.to_i).to eq @visiting_team_games + 1
end

When(/^the visiting team (wins|loses)$/) do |result|
	visit new_game_path
	game = GamePage.find
	game.visiting_team_id = @visiting_team.name
	game.home_team_id = @home_team.name
	game.game_date = '2013-10-10'
	if result == 'wins'
		game.goals_home_team = 1
		game.goals_visiting_team = 2
	else
		game.goals_home_team = 2
		game.goals_visiting_team = 1
	end
	game.save
end

Given(/^two teams with two wins$/) do
	teams = Team.all
	create :home_win, home_team: teams[0], visiting_team:teams[3]
	create :home_win, home_team: teams[0], visiting_team:teams[4]
	create :home_win, home_team: teams[1], visiting_team:teams[3]
	create :home_win, home_team: teams[1], visiting_team:teams[4]
end

Given(/^two teams with one win$/) do
	teams = Team.all
	create :home_win, home_team: teams[3], visiting_team:teams[5]
	create :home_win, home_team: teams[4], visiting_team:teams[6]
end

Then(/^the top (\d+) teams are marked for promotion$/) do |number_of_teams|
	top_teams = TeamPage.all.take(3).collect {|t| t.name}
	# promoted_teams = TeamPage.all(nil, ".promotion").collect {|t| t.name}
	promoted_teams = PromotedTeams.all.collect {|t| t.name}
	expect(promoted_teams).to eq top_teams
end

Then(/^the bottom (\d+) teams are marked for degradation$/) do |number_of_teams|
	bottom_teams = TeamPage.all.reverse.take(3).collect {|t| t.name}
	degradaded_teams = TeamPage.all( nil, ".degradation").reverse.collect {|t| t.name}
	expect(degradaded_teams).to eq bottom_teams
end

