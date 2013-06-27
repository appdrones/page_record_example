json.array!(@teams) do |team|
  json.extract! team, :name, :competition, :point, :ranking
  json.url team_url(team, format: :json)
end
