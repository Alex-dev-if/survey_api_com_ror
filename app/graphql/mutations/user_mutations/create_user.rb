module Mutations
  module UserMutations
    class CreateUser < BaseMutation

      argument :username, String, required: true
      argument :password, String, required: true
      argument :role, String, required: true

      field :user, Types::UserType, null: false
      field :token, String, null: false

      def resolve(username: , password: , role: )
        if User.exists?(username: username) #Impedir dois usuários com o mesmo username
          raise GraphQL::ExecutionError, "Já existe usuário com esse username"
        end

        user = UserModule::UserCreator.call(username, password, role)

        if user.save  
          token = JsonWebToken::Jwt.new.encode_token(role, user.id)
          {user: user, token: token}
        end
      end

    end
  end
end
