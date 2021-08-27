class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @animals = Animal.all
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    if params[:back]
      render :new
    else
      if @animal.save
        redirect_to animal_path(id: @animal.id), notice: "新しい動物を登録しました！"
      else
        render :new
      end
    end
  end

  def show
    @favorite_animal = current_user.favorite_animals.find_by(animal_id: @animal.id)
  end

  def edit
    unless current_user.admin == true
      redirect_to animals_path, notice: "権限がありません！"
    end
  end

  def update
    if @animal.update(animal_params)
      redirect_to animal_path(id: @animal.id), notice: "動物を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    unless current_user.admin == true
      redirect_to zoos_path, notice: "権限がありません！"
    else
      @animal.destroy
      redirect_to animals_path, notice:"動物を削除しました！"
    end
  end

  private
  def animal_params
    params.require(:animal).permit(
      :name,
      :english_name,
      :scientific_name,
      :distribution,
      :endangered_specy,
      :content,
      :photo,
      :kingdom,
      :phylum,
      :animal_class,
      :order,
      :family,
      :genus,
      :specy,
      :subspecy,
      :wikipedia,
      :image_cache
    )
  end

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def admin_user
    if current_user.admin != true
      redirect_to new_user_session_path, notice: "権限がありません！"
    end
  end
end
