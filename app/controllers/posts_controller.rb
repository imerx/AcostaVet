class PostsController < InheritedResources::Base



    def index
		redirect_to root_path
	end
    def new
   	redirect_to root_path
    end

end
