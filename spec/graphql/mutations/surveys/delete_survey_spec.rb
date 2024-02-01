
require 'rails_helper'
require 'httparty'

RSpec.describe "DeleteSurvey" do 
    it 'delete a survey' do

        query = <<~GQL
        mutation DeleteSurvey {
            deleteSurvey(input: { id: "82" }) {
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
        expect(result.dig("data", "deleteSurvey", "id")).not_to be_blank

    
  end

end
    
