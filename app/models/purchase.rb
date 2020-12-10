class Purchase < ActiveRecord::Base
    belongs_to :phone
    belongs_to :user
    def purchase_phone
        
        if self.user.money >= self.phone.models.find_by(phone_id: phone_id).price
            purchase_now
        else
            "Sorry, not enough money!"
        end
    end
    def purchase_now
        new_amount = self.user.money - self.phone.models.find_by(phone_id: phone_id).price
        self.user.update(:money => new_amount)
        "Thank you for buying #{self.phone.make} #{self.phone.models.find_by(phone_id: phone_id).name_model}!"
    end
end