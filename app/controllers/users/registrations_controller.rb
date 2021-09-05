class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: [:destroy, :destroy]

  def ensure_normal_user
    if resource.email == 'guest@example.com' || resource.email == 'admin@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの更新・削除はできません！'
    end
  end

  def profile_edit
  end

  def profile_update
    current_user.assign_attributes(account_update_params)
    if current_user.save
	  redirect_to my_page_path, notice: 'プロフィールを更新しました'
    else
      render "profile_edit"
    end
  end

  # def update_resource(resource, params)
  #   resource.update_without_password(params)
  # end

end
