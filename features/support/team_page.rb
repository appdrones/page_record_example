class TeamPage < PageRecord::Base
	add_attributes %w(number_of_games)
end

class PromotedTeams < TeamPage
	type :team
	filter ".promotion"
end

class DegradadedTeams < TeamPage
	type :team
	filter ".degradation"
end
