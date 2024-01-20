module QuestionModule
    class QuestionUpdater < ApplicationService
        def initialize(text, question_type, required, options, id)
            @text = text
            @id = id
            @question_type = question_type
            @required = required
            @options = options
        end
        
        def call
            update_question
        end
        
        private 

        def update_question
            question = Question.find(@id)
            question.update!(
            text: @text,
            question_type: @question_type, 
            required: @required, 
            options: @options, 
            )
            question
        end
    end
end