class Purchase < ApplicationRecord
    belongs_to :phone
    belongs_to :user
end
