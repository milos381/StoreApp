class Model < ApplicationRecord
    belongs_to :phone

    def phone_make
        self.phone.make
    end
end
