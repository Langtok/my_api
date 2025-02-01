require 'swagger_helper'

RSpec.describe 'Leagues API', type: :request do
  path '/api/v1/leagues' do
    get 'Retrieve all leagues' do
      tags 'Leagues'
      produces 'application/json'

      response '200', 'success' do
        schema type: :object,
               properties: {
                 data: {
                   type: :array,
                   items: {
                     type: :object,
                     properties: {
                       id: { type: :integer },
                       name: { type: :string },
                       country: { type: :string },
                       season: { type: :string }
                     }
                   }
                 }
               }

        run_test!
      end
    end
  end
end
