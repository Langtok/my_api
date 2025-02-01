# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_team, Types::TeamType, null: false do
      argument :name, String, required: true
      argument :country, String, required: true
    end

    def create_team(name:, country:)
      Team.create!(name: name, country: country)
    end
  end
end
