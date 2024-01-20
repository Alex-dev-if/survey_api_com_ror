module UserModule
    class UserCreator < ApplicationService
        def initialize(username, password, role)
            @username = username
            @password = password
            @role = role
        end
    
        def call
            create_user
        end
        
        private 
    
        def create_user
            User.create!(username: @username, password: @password, role: @role)
            rescue ActiveRecord::RecordNotUnique => e
        end
    end
end