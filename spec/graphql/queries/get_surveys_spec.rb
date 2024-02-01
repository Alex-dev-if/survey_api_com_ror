
require 'rails_helper'
require 'httparty'

RSpec.describe "GetSurvey" do 

    it 'get surveys' do

        query = <<~GQL
        query Surveys {
              surveys{
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
      expect(result.body['errors']).to be_nil

    end

end
    
