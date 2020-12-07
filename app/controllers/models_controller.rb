class ModelsController < ApplicationController
    def index
        @models = Model.all
    end
    def new
        @model = Model.new
    end
    def create
        @model = Model.create(model_params)
        redirect_to @model
    end
    def edit
        @model = Model.find(params[:id])
    end
    def update
        @model = Model.find(params[:id])
        if @model.save
          @model.update(model_params)
          redirect_to @model
        else
          redirect_to edit_model_path(@model)
        end
    end
    def show
        @model = Model.find(params[:id])
    end
    private
    def model_params
        params.require(:model).permit(:model_name, :price)
    end
end
