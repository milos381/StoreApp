class Model < ApplicationRecord
    belongs_to :phone
    has_secure_password
end
