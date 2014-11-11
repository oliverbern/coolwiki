class Wiki < ActiveRecord::Base
	belongs_to :user
	has_many :user
	
	def preview
		"#{self.title} #{self.body}"
	end
	
end
