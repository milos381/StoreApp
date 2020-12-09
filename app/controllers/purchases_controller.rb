class PurchasesController < ApplicationController
  before_action :logged_in?
    def create
        purchase = Purchase.create(purchase_params)
        message = purchase.purchase_phone
        redirect_to user_path(purchase.user), flash: { message: message }
      end
    
      private
    
      def purchase_params
        params.require(:purchase).permit(
        :user_id,
        :phone_id
        )
      end
end
