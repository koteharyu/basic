class Mypage::NotificationSettingsController < Mypage::BaseController

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(setting_params)
      redirect_to edit_mypage_notification_setting_path, success: "updated your configure"
    else
      flash.now[:danger] = "please one more"
      render :edit
    end
  end

  private

  def setting_params
    params.require(:user).permit(:notification_on_like, :notification_on_comment, :notification_on_follow)
  end
end
