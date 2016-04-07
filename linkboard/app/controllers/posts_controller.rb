class PostsController < ApplicationController
  before_action :is_authenticated?, except: [:index, :destroy]

  def index
  	@posts = Post.all
    @comments = Comment.all
  end

  def new
  	@post= Post.new
  end

  def show
    redirect_to root_path
  end

  def create
  	# Post.create post_params
  	post = Post.create post_params do |p|
  		p.user_id = @current_user.id
  		p.save
  	end
    if post.valid?
      flash[:success] = 'Post created'
      redirect_to root_path
    else
      messages = post.errors.map { |k, v| "#{k} #{v}" }
      flash[:danger] = messages.join(', ')
      redirect_to new_post_path
    end
  end

  def destroy
    id =:params[:id]
    post = Post.find_by_id(id)
    post.destroy
    redirect_to root_path
  end

  private
  def post_params
  	params.require(:post).permit(:title, :link, :user_id)
  end
end
