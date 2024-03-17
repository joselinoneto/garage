class User < ApplicationRecord
    has_secure_password :password, validations: true
    validates :email, presence: true, uniqueness: true
end
