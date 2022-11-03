class SigninController < ApplicationController
  def show
    @signin
  end

  def create
    @user = User.find_by("email"=>params['signin']['email'])
    @password = params['signin']['password']

    if @user.present? && @user.authenticate(@password)
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Sign in successful!"
    else
      flash.now[:alert] = 'Invalid email or password'
      redirect_to root_path
    end

  end

  

  private

  def signin_params
    params.require(:signin,).permit(
      :email,
      :password
    )
  end
end