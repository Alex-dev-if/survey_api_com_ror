module SurveyModule
class SurveyUpdater < ApplicationService

    def initialize(id, name)
        @name = name
        @id = id
    end

    def call
        update_survey
    end
    
    private 
    
    def update_survey
        survey = Survey.find(@id)
        survey.update!(name: @name)
        survey
    end

end

end
