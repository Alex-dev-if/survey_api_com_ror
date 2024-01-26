
require 'rails_helper'
require 'httparty'

    RSpec.describe "GetQuestion" do 

        it 'get questions' do

            query = <<~GQL
            query Questions {
                questions {
                    createdAt
                    id
                    options
                    questionType
                    required
                    surveyId
                    text
                    updatedAt
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
    
