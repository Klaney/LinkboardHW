class CommentsController < ApplicationController

	def index
		@post = Post.find params[:post_id]
		@comment = Comment.new

	end

  def new
  	redirect_to root_path
  end

  def create
  	 comment = Comment.create comment_params do |c|
  		c.user_id = @current_user.id
  		c.post_id = params[:post_id]
  		c.save
  	end
  	redirect_to root_path
  end

  def destroy
  	Comment.find(params[:id]).delete
  	redirect_to root_path
  end

  private
  def comment_params
  	params.require(:comment).permit(:post_id, :body, :user_id)
  end
end
