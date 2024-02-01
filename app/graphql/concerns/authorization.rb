module Authorization 
    include JsonWebToken
    def authorize!(action, resource)
        user = JsonWebToken::Jwt.new.authorized_user(context[:request])
        ability = Ability.new(user)
        ability.authorize!(action, resource)
    end
end

