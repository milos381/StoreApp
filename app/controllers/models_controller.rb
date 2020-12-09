class ModelsController < ApplicationController
    before_action :logged_in?
    def index
        @models = Model.all
        @user = User.find_by(id: session[:user_id])
    end
    def new
        @model = Model.new
    end
    def create
        @model = Model.create(model_params)
        @model.phone = Phone.find_or_create_by(phone_params)
        #phone_make: params[:model][:phone_make]
        
    end
    def edit
        @model = Model.find(params[:id])
    end
    def update
        @model = Model.find(params[:id])
        if @model.save
          @model.update(model_params)
        else
          redirect_to edit_model_path(@model)
        end
    end
    def show
        @model = Model.find(params[:id])
    end
    private
    def model_params
        params.require(:model).permit(:phone_make, :name_model, :price)
    end
    def phone_params
        params.require(:phone).permit(:make)
    end
end
