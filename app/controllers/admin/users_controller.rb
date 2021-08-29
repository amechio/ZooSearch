class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :admin_user

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_user_path(@user.id), notice: "ユーザを登録しました！"
    else
      render :new
    end
  end

  def show
    favorite_zoos = FavoriteZoo.where(user_id: current_user.id).pluck(:zoo_id)
    @favorite_zoo_list = Zoo.find(favorite_zoos)

    favorite_animals = FavoriteAnimal.where(user_id: current_user.id).pluck(:animal_id)
    @favorite_animal_list = Animal.find(favorite_animals)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user.id), notice: "編集しました！"
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path, notice:"削除しました！"
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :live_prefecture,
      :favorite_prefecture,
      :content,
      :icon,
      :owner,
      :admin
    )
  end

  def set_user
    @user = User.find(params[:id])
  end

  def admin_user
    if current_user.admin != true
      redirect_to new_user_session_path, notice: "権限がありません！"
    end
  end
end
