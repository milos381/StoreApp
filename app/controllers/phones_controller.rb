class PhonesController < ApplicationController
    before_action :logged_in?
    def index
        @phones = Phone.all
        @user = User.find_by(id: session[:user_id])
    end
    def new
        @phone = Phone.new
        @user = User.find_by(id: session[:user_id])
    end
    def create
        @phone = Phone.create(phone_params)
        @model = @phone.models.create(model_params)
        redirect_to @phone
    end
    def edit
        @phone = Phone.find(params[:id])
        @purchase = @phone.purchases.build(user_id: current_user.id)
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
        # binding.pry
        @model = @phone.models
        
       @purchase = @phone.purchases.build(user_id: current_user.id)
       
    end
    private
    def phone_params
        params.require(:phone).permit(:make)
    end
    def model_params
        params.require(:model).permit(:name_model, :price)
    end
end
