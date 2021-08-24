class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy]
  before_action :set_q, only: [:index, :search]

  def index
    @animals = Animal.all
    @q = Animal.ransack(params[:q])
    @animals = @q.result
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
        redirect_to animals_path, notice: "新しい動物を登録しました！"
      else
        render :new
      end
    end
  end

  def show
    @favorite_animal = current_user.favorite_animals.find_by(animal_id: @animal.id)
  end

  def edit
  end

  def update
    if @animal.update(animal_params)
      redirect_to animals_path, notice: "動物を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @animal.destroy
    redirect_to animals_path, notice:"動物を削除しました！"
  end

  def confirm
    @animal = Animal.new(animal_params)
    render :new if @animal.invalid?
  end

  def search
    index
    render :index
  end


  private
  def animal_params
    params.require(:animal).permit(
      :name,
      :english_name,
      :scientific_name,
      :distribution,
      :endangered_species,
      :content,
      :photo,
      :kingdom,
      :phylum,
      :animal_class,
      :order,
      :family,
      :genus,
      :species,
      :subspecies,
      :wikipedia,
      :image_cache
    )
  end

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def set_q
    @q = Zoo.ransack(params[:q])
  end

end
