class Phone < ApplicationRecord
    has_many :models
    has_many :users, through: :purchase
end
