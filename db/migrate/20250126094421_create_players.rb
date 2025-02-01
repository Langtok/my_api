class CreatePlayers < ActiveRecord::Migration[8.0]
  def change
    create_table :players do |t|
      t.string :name
      t.references :team, null: false, foreign_key: true
      t.string :position
      t.integer :goals
      t.integer :matches_played

      t.timestamps
    end
  end
end
