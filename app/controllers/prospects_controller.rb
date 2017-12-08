class ProspectsController < ApplicationController

	def index 
	 @prospects = Prospect.all
	end

	def new 
	 @prospect = Prospect.new
	end
	
	def create 
	 @prospect = Prospect.new(prospect_params)
	 if @prospect.save
	 redirect_to prospects_path, notice: "Successfully added prospect"
     else
	 render action: "new"
	 end
    end

    def edit
     @prospect = Prospect.find(params[:id])
    end
    
    def update
     @prospect = Prospect.find(params[:id])
     if @prospect.update_attributes(prospect_params)
     redirect_to prospect_path(@prospect.id),notice: "Successfully updated prospect" 
     else
     render action: "edit"
     end
    end
    
    def show
     @prospect = Prospect.find(params[:id])
    end
    	
    def destroy
     @prospect = Prospect.find(params[:id])
     @prospect.destroy
     redirect_to prospects_path, notice: "successfully destroyed the stage"
    end

    private
    def prospect_params
     params[:prospect].permit(:full_name, :email, :phone, :location, :stage_id,:managed_by)
    end 
end

