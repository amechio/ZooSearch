class FavoriteAnimalsController < ApplicationController
  def index
    @favorite_animals = current_user.favorite_animals
  end

  def create
    favorite_animal = current_user.favorite_animals.create(animal_id: params[:animal_id])
    redirect_to animal_path(favorite_animal.animal.id), notice: "#{favorite_animal.animal.name}をお気に入り登録しました"
  end

  def destroy
    favorite_animal = current_user.favorite_animals.find_by(id: params[:id]).destroy
    redirect_to animal_path(favorite_animal.animal.id), notice: "#{favorite_animal.animal.name}をお気に入り解除しました"
  end
end
