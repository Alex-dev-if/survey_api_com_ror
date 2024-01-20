module QuestionModule
    class QuestionDestroyer < ApplicationService
        def initialize(question_id)
            @question_id = question_id
        end

        def call
            delete_question
        end
        
        private 

        def delete_question
            Question.find(@question_id).destroy
            
        end
        
    end
    end