module SurveyModule
    class SurveyUpdater < ApplicationService

        def initialize(id, name, open)
            @name = name
            @id = id
            @open = open
            @params = {name: @name, open: @open}
        end

        def call
            update_survey
        end
        
        private 
        
        def update_survey
            @params.reject! {|key, value| value.nil?}

            survey = Survey.find(@id)
            survey.update!(@params) 
            survey
        end
    end
end
