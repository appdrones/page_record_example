class Game < ActiveRecord::Base
  belongs_to :visiting_team, class_name: Team
  belongs_to :home_team, class_name: Team
  after_save :update_points_and_ranking


  private

  def update_points_and_ranking
    update_points
    Team.update_ranking
  end

	def update_points
		if home_win?
			add_points(home_team, 3)
		elsif home_lose?  
			add_points(visiting_team, 3)
		else # draw
			add_points(visiting_team, 1)
			add_points(home_team, 1)
		end
  end

  def add_points( team, points)
  	team.points = +points
  	team.save!
  end

  def home_win?
  	goals_home_team > goals_visiting_team
  end

  def home_lose?
  	goals_home_team < goals_visiting_team
  end


end
