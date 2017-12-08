class Prospect < ActiveRecord::Base
	belongs_to :stage
	belongs_to :user, foreign_key: :managed_by
    
     validates_presence_of :full_name, :email, :phone, :stage_id, :managed_by, :location

    
end
