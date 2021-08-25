class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:index, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if params[:back]
      render :new
    else
      if @user.save
        redirect_to user_path(@user.id), notice: "ユーザ登録しました！"
      else
        render :new
      end
    end
  end

  def show
    favorite_zoos = FavoriteZoo.where(user_id: current_user.id).pluck(:zoo_id)
    @favorite_zoo_list = Zoo.find(favorite_zoos)

    favorite_animals = FavoriteAnimal.where(user_id: current_user.id).pluck(:animal_id)
    @favorite_animal_list = Animal.find(favorite_animals)
  end

  def edit
    unless current_user.id == @user.id || current_user.admin == true
      redirect_to user_path(id: @user.id), notice: "権限がありません！"
    end
  end

  def update
    unless current_user.id == @user.id || current_user.admin == true
      redirect_to user_path(id: @user.id), notice: "権限がありません！"
    else
      if @user.update(user_params)
        redirect_to users_path, notice: "プロフィールを編集しました！"
      else
        render :edit
      end
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice:"動物園を削除しました！"
  end

  private
  def user_params
    params.require(:user).permit(
      :name,
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
