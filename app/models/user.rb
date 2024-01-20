class User < ApplicationRecord
    has_secure_password
    has_many :surveys
    validates :role, inclusion: { in: ["user", "adm"] }

end
