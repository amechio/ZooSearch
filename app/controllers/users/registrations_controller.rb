class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: [:destroy, :destroy]

  def ensure_normal_user
    if resource.email == 'guest@example.com' || resource.email == 'admin@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの更新・削除はできません！'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user.assign_attributes(account_update_params)
    if @user.save
      bypass_sign_in(@user)
	    redirect_to user_path(id: @user.id), notice: 'プロフィールを更新しました'
      # redirect_to root_path, notice: "プロフィールを編集しました！もう一度ログインしてください"
    else
      render "edit"
    end
  end

  protected

  def update_params
   params.require(:user).permit(:update, keys: [
     :name,
     :email,
     # :password,
     # :password_confirmation,
     :live_prefecture,
     :favorite_prefecture,
     :content,
     :icon,
     :owner,
     :admin
     ])
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    user_profile_path(current_user)
  end

end
