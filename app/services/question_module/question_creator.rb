module QuestionModule
    class QuestionCreator < ApplicationService
        def initialize(text, question_type, required, options, survey_id)
            @text = text
            @question_type = question_type
            @required = required
            @options = options
            @survey_id = survey_id

        end

        def call
            create_question
        end
        
        private 
    
        def create_question
            Question.create!(text: @text, question_type: @question_type, required: @required, options: @options, survey_id: @survey_id)
        end
    end
end