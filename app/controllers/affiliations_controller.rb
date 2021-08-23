class AffiliationsController < ApplicationController
  def create
    affiliations = current_zoo.favorites.create(animal_id: params[:animal_id])
    redirect_to animals_path, notice: "#{affiliations.animal.zoo.name}を動物園に登録しました"
  end
  def destroy
    affiliations = current_zoo.favorites.find_by(id: params[:id]).destroy
    redirect_to animals_path, notice: "#{affiliations.animal.zoo.name}を動物園から外しました"
  end
end
