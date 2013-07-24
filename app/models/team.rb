class Team < ActiveRecord::Base
	has_many :home_games, class_name: 'Game', foreign_key: 'home_team_id'
	has_many :out_games, class_name: 'Game', foreign_key: 'visiting_team_id'

	validates_presence_of :name
	validates_presence_of :competition

  def self.update_ranking
    teams = Team.order('points desc')
    position = 1
    teams.each do |team|
      team.ranking = position
      team.save!
      position +=1
    end
  end


	def games
		out_games + home_games
	end


  def promotion?
    number_of_teams = Team.all.length
    ranking <= 3 && number_of_teams >= 6
  end

  def degradation?
    number_of_teams = Team.all.length
    ranking >= number_of_teams - 2 && number_of_teams >= 6
  end

	def zone?
		if promotion?
			'promotion'
		elsif degradation?
			'degradation'
		else
			''
		end
	end

	def number_of_games
		games.length
	end

end
