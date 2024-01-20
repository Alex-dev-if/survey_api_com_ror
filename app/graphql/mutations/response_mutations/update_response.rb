module Mutations
    module ResponseMutations
        class UpdateResponse < BaseMutation

        argument :content, GraphQL::Types::JSON, required: true
        argument :id, ID, required: true
                    
        type Types::ResponseType

        def resolve(content:, id:)
            ResponseModule::ResponseUpdater.call(id, content)

        end
        end
    end
end
