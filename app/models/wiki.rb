class Wiki < ActiveRecord::Base
	belongs_to :user
	has_many :collaborators
	has_many :users, through: :collaborators
	
	def preview
		"#{self.title} #{self.body}"
	end
	
end
