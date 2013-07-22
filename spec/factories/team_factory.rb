FactoryGirl.define do

  sequence :team_name do |n|
     "Team #{n}"
  end


  factory :team, aliases: [:visiting_team, :home_team] do
    name        { FactoryGirl.generate(:team_name) }
    competition "Eredivisie"
  end

end

