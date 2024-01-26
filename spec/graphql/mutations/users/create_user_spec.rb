
require 'rails_helper'

    RSpec.describe "CreateUser" do 
        it 'creates a user' do
            query = <<~GQL
            mutation CreateUser {
                createUser(input: { username: "", password: "1234", role: "adm" }) {
                    token
                    user {
                        id
                        role
                        username
                    }
                }
            }
            
          GQL
            
          result = Survey5Schema.execute(query)
          expect(result.dig("data", "createUser", "user", "id")).not_to be_blank

        
      end

    end
    
