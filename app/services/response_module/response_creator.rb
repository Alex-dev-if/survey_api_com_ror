module ResponseModule

    class ResponseCreator < ApplicationService
        def initialize(content, question_id)
            @content = content
            @question_id = question_id
        end
        
        def call
            create_responses
        end
        
        private 
    
        def create_responses
            Response.create!(content: @content, question_id: @question_id)
        end
    end
end