class UsersController < ApplicationController
	before_filter :authorize, only: [:show]

	def create
    if current_user
      redirect_to profile_path
    else
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        # redirect_to '/profile'
        redirect_to profile_path
      else
        # redirect_to '/signup'
        redirect_to root_path
      end
    end
  end

  # show current_user
  def show
    @post = Post.all
    render :show
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

end
