module ApplicationHelper

	def class_name(team)
		unless team.zone?.blank?
			"class=#{team.zone?}"
		end
	end

end
