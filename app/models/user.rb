class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
				 
				 
				 
				 has_many :collaborative_wikis, through: :collaborators, class_name: :wiki
				 has_many :wikis

				 
				 enum role: [:user, :premium, :admin]

	def can_modify?(wiki)
  		self.premium? && self.id == wiki.user_id
	end

	def can_see_as_collaborator?(wiki)
		wiki.privatewiki? && self.id == wiki.user_id || wiki.collaborators.map(&:user_id).include?(self.id) || self.role == "admin"
	end
end
