module SurveyModule
    class SurveyCreator < ApplicationService
        def initialize(user_id, name, open)
            @user_id = user_id
            @name = name
            @open = open
        end

        def call
            create_survey
        end
        
        private 

        def create_survey
            Survey.create!(name: @name, user_id: @user_id, open: @open)
        end
    end
end