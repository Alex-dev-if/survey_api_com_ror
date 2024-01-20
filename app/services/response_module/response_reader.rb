module ResponseModule
    class ResponseReader < ApplicationService
        def initialize(survey_id)
            @survey_id = survey_id
        end
        
        def call
            read_response
        end
        
        private 
    
        def read_response
            @responses = Response.joins(question: :survey).where('surveys.id' => @survey_id)
            @responses.as_json
        end
    end
end