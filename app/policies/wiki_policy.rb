class WikiPolicy
	attr_reader :current_user, :wiki
 
  	def initialize(current_user, wiki)
	    @current_user = current_user
	    @wiki = wiki
  	end
 
	def update?
	  @wiki.user == @current_user
	end
end