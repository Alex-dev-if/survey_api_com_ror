module SurveyModule
class SurveyDestroyer < ApplicationService
    def initialize(survey_id)
        @survey_id = survey_id
    end
    
    def call
        delete_survey
    end
    
    private 

    def delete_survey
        Survey.find(@survey_id).destroy
        
    end
end
end