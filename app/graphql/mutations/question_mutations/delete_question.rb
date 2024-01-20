module Mutations
module QuestionMutations

    class DeleteQuestion < BaseMutation
      argument :id, ID, required: true
              
      type Types::QuestionType

      def resolve(id:)
        unless context && context[:current_user] && context[:current_user][0]["role"] == "adm"
          raise GraphQL::ExecutionError, "Permissão negada"
        end
        QuestionModule::QuestionDestroyer.call(id)

      end
    end
  end
end