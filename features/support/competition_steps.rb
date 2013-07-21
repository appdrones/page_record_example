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
