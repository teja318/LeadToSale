class User < ActiveRecord::Base
	belongs_to :role
	has_many :prospects, foreign_key: :managed_by
  has_many :customers, foreign_key: :managed_by
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
    #devise :database_authenticatable, :confirmable, :invitable 
     
     validates_presence_of :full_name, :email, :phone
     validates_numericality_of :phone
     validates_uniqueness_of :phone
     #validates_length_of :phone, with_in:(1..10)

    before_create :assign_role
      
      def role?(role)
        self.role.name.include? role
      end  

     
      def assign_role
        role = Role.find_by(name: "sales associate").id
      	self.role_id = role
      end
end


