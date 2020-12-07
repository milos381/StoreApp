class User < ApplicationRecord
    has_many :phones, through: :purchase
    has_secure_password
end
