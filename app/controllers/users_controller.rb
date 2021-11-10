class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to root_path, success: "新規登録成功"
    else
      flash.now[:danger] = "もう一度"
      render :new
    end
  end
  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
