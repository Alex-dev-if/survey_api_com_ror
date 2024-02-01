
require 'rails_helper'
require 'httparty'

RSpec.describe "CreateSurvey" do 
    it 'creates a survey' do

        query = <<~GQL
        mutation CreateSurvey {
            createSurvey(input: { userId: 1 , name: "survey1", open: true }) {
                createdAt
                id
                name
                updatedAt
                userId
                open
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
        expect(result.dig("data", "createSurvey", "id")).not_to be_blank
  end
end
    
