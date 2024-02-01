module Mutations
  module QuestionMutations
    class DeleteQuestion < BaseMutation
      argument :id, ID, required: true
              
      type Types::QuestionType

      def resolve(id:)
        authorize! :delete, Question     
        QuestionModule::QuestionDestroyer.call(id)

      end
    end
  end
end