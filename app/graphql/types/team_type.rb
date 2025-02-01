# app/graphql/types/team_type.rb
module Types
    class TeamType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :country, String, null: false
      # Add other fields here as needed
    end
  end
  