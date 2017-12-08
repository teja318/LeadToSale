class User < ActiveRecord::Base
	belongs_to :role
	has_many :prospects, foreign_key: :managed_by
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
     validates_presence_of :full_name, :email, :phone

    before_create :assign_role
      
      def role?(role)
        self.role.name == role
      end  

      private
      def assign_role
      	self.role_id = Role.last.id
      end
end
