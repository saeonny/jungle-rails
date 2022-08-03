class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.email.downcase!

    if @user.save
      flash[:notice] = "Account created successfully!"
      session[:user_id] = @user.id
      redirect_to root_path
    else

      flash.now.alert = "ERROR: couldn't create account. Please try again."
      render :new
    end
  end

private

  def user_params

    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end

end
