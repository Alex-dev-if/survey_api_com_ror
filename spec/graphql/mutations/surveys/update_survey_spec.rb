
require 'rails_helper'
require 'httparty'

    RSpec.describe "UpdateSurvey" do 
        it 'update a survey' do

            query = <<~GQL
            mutation UpdateSurvey {
                updateSurvey(input: { name: "survey2", id: "1" }) {
                    createdAt
                    id
                    name
                    updatedAt
                    userId
                }
            }
            
          GQL
          bearer_token = 'eyJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiYWRtIiwiaWQiOjl9.V3VA14NjboFXPBZrnTLwLiYciqrE2nhoThK4ICsqOsI'

          result = HTTParty.post(
            'http://127.0.0.1:3000/graphql',
            body: { query: query }.to_json,
            headers: {
              'Content-Type' => 'application/json',
              'Authorization' => "Bearer #{bearer_token}"
            }
          )
            expect(result.dig("data", "updateSurvey", "id")).not_to be_blank
            
        
      end

    end
    
