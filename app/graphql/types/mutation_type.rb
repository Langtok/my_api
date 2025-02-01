# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_league, mutation: Mutations::CreateLeague
    field :update_league, mutation: Mutations::UpdateLeague
    field :delete_league, mutation: Mutations::DeleteLeague

    
  end
end