class PostsController < ApplicationController

before_filter :authenticate

def index
	if params[:type] == "All Posts"
		@title = 'All Posts'
		@posts = Post.all
	elsif params[:type] == "Unanswered Posts"
		@title = 'Unanswered Posts'
		@posts = Post.where('comments_count = 0')
	else
		@title = 'My Posts'
		@posts = current_user.posts
	end
end

def new
	@title = "New Post"
	@post = Post.new
end

def create
	@post=current_user.posts.build(params[:post])
   if @post.save
      redirect_to posts_path, flash: {success: "Post submitted!"}
   else
 		@title = "New Post"
      render 'new'
   end
end

def show
	@title = "View Question"
	@post = Post.find(params[:id])
	@post_comments = @post.comments
	@comment = Comment.new
end

def destroy
   Post.find(params[:id]).destroy
   redirect_to posts_path, flash: {success: "Post deleted!"}
end

end
