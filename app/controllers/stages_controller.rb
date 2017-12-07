class StagesController < ApplicationController

	def index
     @stages = Stage.all
    end

    def new
     @stage = Stage.new
    end
    
    def create
     @stage = Stage.new(stage_params)
     if @stage.save
     redirect_to stages_path,notice: "successfully added stage"
     else
     render action: "new"
     end
    end

    def edit
     @stage = Stage.find(params[:id])
    end
    
    def update
     @stage = Stage.find(params[:id])
     if @stage.update_attributes(stage_params) 
     redirect_to stage_path(@stage.id),notice: "successfully updated stage"	
     else
     render action: "edit"
     end
    end

    def show
     @stage = Stage.find(params[:id])
    end
    
    def destroy
     @stage = Stage.find(params[:id])
     @stage.destroy
     redirect_to stages_path, notice: "successfully destroyed the stage"
    end

    private
    def stage_params
     params[:stage].permit(:name, :description, :interest_level)	
    end
end
