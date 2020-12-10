class User < ApplicationRecord
    include ActiveModel::Validations
    has_many :phones, :through => :purchases
    has_secure_password
    validates :name, length: { minimum: 2 }
end