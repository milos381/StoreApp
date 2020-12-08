class ModelsController < ApplicationController
    def index
        @models = Model.all
    end
    def new
        @model = Model.new
    end
    def create
        @model = Model.create(model_params)
        @model.phone = Phone.find_or_create_by(phone_params)
        
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
        params.require(:model).permit(:name_model, :price)
    end
    def phone_params
        params.require(:phone).permit(:make)
    end
end
