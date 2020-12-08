class User < ApplicationRecord
    has_many :phones, :through => :purchases
    has_secure_password
end
