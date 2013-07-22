class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :competition
      t.integer :points, default: 0
      t.integer :ranking

      t.timestamps
    end
  end
end
