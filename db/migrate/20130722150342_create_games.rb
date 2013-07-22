class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :visiting_team, index: true
      t.references :home_team, index: true
      t.date :game_date
      t.integer :goals_home_team
      t.integer :goals_visiting_team

      t.timestamps
    end
  end
end
