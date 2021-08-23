class FavoriteZoosController < ApplicationController
  def create
    favorite_zoo = current_user.favorite_zoos.create(zoo_id: params[:zoo_id])
    redirect_to zoos_path, notice: "#{favorite_zoo.zoo.name}をお気に入り登録しました"
  end

  def destroy
    favorite_zoo = current_user.favorite_zoos.find_by(id: params[:id]).destroy
    redirect_to zoos_path, notice: "#{favorite_zoo.zoo.name}をお気に入り解除しました"
  end
end

# zoo_path(zoo.id)
