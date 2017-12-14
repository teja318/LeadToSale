class Customer < ActiveRecord::Base
	belongs_to :user, foreign_key: :managed_by

	 validates_presence_of :full_name, :email, :phone, :location

	after_create :empty
    #Prospect.delete(user.prospects.pluck(:id))
	def empty
     user = self.user
     user.prospects.each do |prospect|
     	if prospect.full_name == self.full_name
          prospect.delete
        end
     end   
	end
end
