class PhonesController < ApplicationController
    def index
        @phones = Phone.all
        @user = User.find_by(id: session[:user_id])
    end
    def new
        @phone = Phone.new
    end
    def create
        @phone = Phone.create(phone_params)
        redirect_to @phone
    end
    def edit
        @phone = Phone.find(params[:id])
        @purchase = @phone.purchase.build(user_id: current_user.id)
    end
    def update
        @phone = Phone.find(params[:id])
        if @phone.save
          @phone.update(phone_params)
          redirect_to @phone
        else
          redirect_to edit_phone_path(@phone)
        end
    end
    def show
        @phone = Phone.find(params[:id])
        @purchase = @phone.purchase.build(user_id: current_user.id)
    end
    private
    def phone_params
        params.require(:phone).permit(:make)
    end
end
