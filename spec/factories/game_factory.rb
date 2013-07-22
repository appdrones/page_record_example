FactoryGirl.define do

  factory :game do
    visiting_team
    home_team
    goals_home_team 1
    goals_visiting_team 1

    factory :home_win, parent: :game do
      goals_visiting_team 1
      goals_home_team 2
    end

    factory :home_lose, parent: :game do
      goals_visiting_team 2
      goals_home_team 1
    end

  end

end
