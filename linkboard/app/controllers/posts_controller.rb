class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def new
  	@post= Post.new
  end

  def create
  	# Post.create post_params
  	redirect_to root_path
  	post = Post.create post_params do |p|
  		p.user_id = @current_user.id
  		p.save
  	end
  end

  private
  def post_params
  	params.require(:post).permit(:title, :link, :user_id)
  end
end
