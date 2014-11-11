class Wiki < ActiveRecord::Base
	belongs_to :user
	
	def preview
		"#{self.title} #{self.body}"
	end
	
end
