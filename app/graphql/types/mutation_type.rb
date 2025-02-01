# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_league, mutation: Mutations::CreateLeague
    field :update_league, mutation: Mutations::UpdateLeague
    field :delete_league, mutation: Mutations::DeleteLeague

    field :create_match, mutation: Mutations::CreateMatch
    field :update_match, mutation: Mutations::UpdateMatch
    field :delete_match, mutation: Mutations::DeleteMatch
  end
end