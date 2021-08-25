class FavoriteZoosController < ApplicationController
  def index
    @favorite_zoos = current_user.favorite_zoos
  end

  def create
    favorite_zoo = current_user.favorite_zoos.create(zoo_id: params[:zoo_id])
    redirect_to zoo_path(favorite_zoo.zoo.id), notice: "#{favorite_zoo.zoo.name}をお気に入り登録しました"
  end

  def destroy
    favorite_zoo = current_user.favorite_zoos.find_by(id: params[:id]).destroy
    redirect_to zoo_path(favorite_zoo.zoo.id), notice: "#{favorite_zoo.zoo.name}をお気に入り解除しました"
  end
end
