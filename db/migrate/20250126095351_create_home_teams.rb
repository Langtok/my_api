class CreateHomeTeams < ActiveRecord::Migration[8.0]
  def change
    create_table :home_teams do |t|
      t.timestamps
    end
  end
end
