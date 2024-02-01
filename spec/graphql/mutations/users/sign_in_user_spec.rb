
require 'rails_helper'

RSpec.describe "Sign In" do 
    it 'Realizar login' do
        user = create(:user)

        query = <<~GQL
        mutation SigninUser {
            signinUser(input: { password: "1234", username: "" }) {
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
        p result

    
    end

end
    
