class CommentsController < ApplicationController
	before_filter :authenticate

	def create
		@post = Post.find(params[:post_id])
		@post_comments = @post.comments
		@comment = Comment.new(params[:comment])
		@comment.post = @post
		@comment.user = current_user
		if @comment.save
		   redirect_to post_path(@post), flash: {success: "Comment submitted!"}
		else
		  render 'posts/show'
		end
	end

end
