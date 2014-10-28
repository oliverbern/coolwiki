class PostPolicy
	attr_reader :user, :wiki
	
	def initialize(user, wiki)
		@user = user
		@wiki = wiki
	end
	
	def update?
		user.admin?
	end
	
end
