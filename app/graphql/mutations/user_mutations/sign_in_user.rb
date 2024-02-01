module Mutations
  module UserMutations
    class SignInUser < BaseMutation
  
      argument :password, String, required: false
      argument :username, String, required: true

      field :token, String, null: false
      field :user, Types::UserType, null: false

      def resolve(password: , username: )
        user = User.find_by username: username

        if user&.authenticate(password) 
            token = JsonWebToken::Jwt.new.encode_token(user.role, user.id)
            { user: user, token: token }
        else
            raise GraphQL::ExecutionError, 'Usuário ou senha inválido(s)'
        end
      end
    end 
  end
end