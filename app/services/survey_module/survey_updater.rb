module SurveyModule
class SurveyUpdater < ApplicationService

    def initialize(id, name)
        @name = name
        @id = id
        @params = {name: @name}
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
