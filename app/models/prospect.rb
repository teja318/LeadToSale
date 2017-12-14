
class Prospect < ActiveRecord::Base
	belongs_to :stage
	belongs_to :user, foreign_key: :managed_by
	validates_presence_of :full_name, :email, :phone, :location
	validates_uniqueness_of :phone
	#validates_length_of :phone, with_in:(1..10)
	
	before_create :stage_save
	before_save :stage_check

	def stage_save
		stage = Stage.find_by(name: "New Opportunity").id
		self.stage_id = stage
	end

	def stage_check
		
		won = Stage.find_by(name: "Won").id
		if self.stage_id == won
			#user = self.user
			
			#user.prospects.each do |prospect|
				customer = Customer.new
				customer.full_name = self.full_name
				customer.email = self.email
				customer.phone = self.phone
				customer.location = self.location
				customer.managed_by = self.managed_by
				customer.save
			#end
		end
	end
end
