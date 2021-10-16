class FavoriteZoosController < ApplicationController
  def index
    @favorite_zoos = current_user.favorite_zoos
  end

  def create
    if signed_in?
      favorite_zoo = current_user.favorite_zoos.create(zoo_id: params[:zoo_id])
      redirect_to zoo_path(favorite_zoo.zoo.id), notice: "#{favorite_zoo.zoo.name}をお気に入り登録しました"
    else
      redirect_to new_user_session_path, notice: "ログインしてください！"
    end
  end

  def destroy
    if signed_in?
      favorite_zoo = current_user.favorite_zoos.find_by(id: params[:id]).destroy
      redirect_to zoo_path(favorite_zoo.zoo.id), notice: "#{favorite_zoo.zoo.name}をお気に入り解除しました"
    else
      redirect_to new_user_session_path, notice: "ログインしてください！"
    end
  end
end
