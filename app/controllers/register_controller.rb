class RegisterController < ApplicationController

  def create
    @register = User.new(register_params)

    if @register.save
      redirect_to "/", notice: 'Thank you for registering!'
    end
  end

  private

  def register_params
    params.require(:register).permit(
      :firstname,
      :lastname,
      :email,
      :password,
      :password_confirmation
    )
  end

end