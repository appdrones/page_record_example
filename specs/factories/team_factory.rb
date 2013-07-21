FactoryGirl.define do

  sequence :team_name do |n|
     "Team #{n}"
  end

  factory :team do
    name        { FactoryGirl.generate(:team_name) }
    competition "Eredivisie"
  end

end

