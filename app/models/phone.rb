class Phone < ApplicationRecord
    has_many :models
    has_many :purchases
    has_many :users, :through => :purchases
    def model_info
        self.model.name_model
        self.model.price
    end
    
    scope :iphone, -> { where(make: "Iphone") }
end
