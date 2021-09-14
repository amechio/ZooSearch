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

  # def update
  #   @user.assign_attributes(account_update_params)
  #   if @user.save
  #     bypass_sign_in(@user)
	#     redirect_to user_path(id: @user.id), notice: 'プロフィールを更新しました'
  #     # redirect_to root_path, notice: "プロフィールを編集しました！もう一度ログインしてください"
  #   else
  #     render "edit"
  #   end
  # end

  def update
    if by_admin_user?(params)
      self.resource = resource_class.to_adapter.get!(params[:id])
    else
      self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    end

    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    if by_admin_user?(params)
      resource_updated = update_resource_without_password(resource, account_update_params)
    else
      resource_updated = update_resource(resource, account_update_params)
    end

    yield resource if block_given?
    if resource_updated
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      if !by_admin_user?(params)
        bypass_sign_in resource, scope: resource_name
      end
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
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
    if params[:password].present? && params[:password_confirmation].present?
      resource.update_attributes(params)
    else
      resource.update_without_password(params)
    end
  end

  def after_update_path_for(resource)
    user_profile_path(current_user)
  end

  def by_admin_user?(params)
    params[:id].present? && current_user_is_admin?
  end

end
