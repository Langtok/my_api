# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Field for fetching leagues
    field :leagues, [Types::LeagueType], null: false, description: "Fetches a paginated list of leagues." do
      argument :page, Integer, required: false, description: "The page number for pagination."
      argument :per_page, Integer, required: false, description: "The number of records per page."
      argument :country, String, required: false, description: "Filter by country."
    end

    def leagues(page: 1, per_page: 20, country: nil)
      scope = League.all
      scope = scope.where(country: country) if country.present?
      scope.page(page).per(per_page)
    end

    # Field for fetching matches
    field :matches, [Types::MatchType], null: false, description: "Fetches a paginated list of matches." do
      argument :page, Integer, required: false, description: "The page number for pagination."
      argument :per_page, Integer, required: false, description: "The number of records per page."
      argument :date_after, GraphQL::Types::ISO8601DateTime, required: false, description: "Filter matches after a certain date."
    end

    def matches(page: 1, per_page: 20, date_after: nil)
      scope = Match.all
      scope = scope.where('match_date > ?', date_after) if date_after.present?
      scope.page(page).per(per_page)
    end
  end
end