class SessionsController < ApplicationController
  def new

  end

  def create
  	user = User.authenticate login_params['email'], login_params['password']

		if user
			user.id
			session[:user_id] = user.id
			flash[:success] = "#{user.email} has logged in!"
			redirect_to root_path
		else
			flash[:danger] = 'You had the wrong email/password'
			redirect_to login_path
		end
  end

  def destroy
  	session[:user_id] = nil
	redirect_to root_path
  end
  private

	def login_params
		params.require(:user).permit(:email, :password)
	end
end
