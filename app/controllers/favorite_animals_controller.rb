class FavoriteAnimalsController < ApplicationController
  def index
    @favorite_animals = current_user.favorite_animals
  end

  def create
    if signed_in?
      favorite_animal = current_user.favorite_animals.create(animal_id: params[:animal_id])
      redirect_to animal_path(favorite_animal.animal.id), notice: "#{favorite_animal.animal.name}をお気に入り登録しました"
    else
      redirect_to new_user_session_path, notice: " ログインしてください！"
    end
  end

  def destroy
    if signed_in?
      favorite_animal = current_user.favorite_animals.find_by(id: params[:id]).destroy
      redirect_to animal_path(favorite_animal.animal.id), notice: "#{favorite_animal.animal.name}をお気に入り解除しました"
    else
      redirect_to new_user_session_path, notice: " ログインしてください！"
    end
  end
end
