class Team < ActiveRecord::Base
	has_many :home_games, class_name: 'Game', foreign_key: 'home_team_id'
	has_many :out_games, class_name: 'Game', foreign_key: 'visiting_team_id'

	def games
		out_games + home_games
	end

end
