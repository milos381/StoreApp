class Model < ApplicationRecord
    belongs_to :phone

    def phone_make
        self.phone.make
    end
    # def phone_make=(make)
    #     self.phone = Phone.find_or_create_by(make: make)
    # end
    
    # def phone_make
    #      self.phone ? self.phone.name : nil
    # end
end
