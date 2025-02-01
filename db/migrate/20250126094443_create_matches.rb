# class CreateMatches < ActiveRecord::Migration[8.0]
#   def change
#     create_table :matches do |t|
#       t.references :home_team, null: false, foreign_key: true
#       t.references :away_team, null: false, foreign_key: true
#       t.string :score
#       t.datetime :match_date
#       t.references :league, null: false, foreign_key: true

#       t.timestamps
#     end
#   end
# end


class CreateMatches < ActiveRecord::Migration[8.0]
  def change
    create_table :matches do |t|
      t.references :home_team, null: false, foreign_key: { to_table: :teams } # Points to the `teams` table
      t.references :away_team, null: false, foreign_key: { to_table: :teams } # Points to the `teams` table
      t.string :score
      t.datetime :match_date
      t.references :league, null: false, foreign_key: true # Points to the `leagues` table

      t.timestamps
    end
  end
end
