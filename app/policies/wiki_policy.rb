class WikiPolicy
	attr_reader :user, :wiki
	
	def initialize(user, wiki)
		@user = user
		@wiki = wiki
	end
	
	def collaborator
		wiki.collaborater_id == user.id
	end
	
	def creator
		wiki.user_id == user.id
	end
	
	def edit?
		user.role(:admin)
	end
	
end
