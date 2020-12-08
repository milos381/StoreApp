class Purchase < ActiveRecord::Base
    belongs_to :phone
    belongs_to :user
    def purchase_phone
        binding.pry
        if self.user.money >= self.phone.model.price
            purchase_now
        else
            "Sorry, not enough money!"
        end
    end
    def purchase_now
        new_amount = self.user.money - self.phone.model.price
        self.user.update(:money => new_amount)
        "Thank you for buying #{self.phone.make} #{self.phone.model.model_name}!"
    end
end
