class ZoosController < ApplicationController
  before_action :set_zoo, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @zoos = Zoo.all
  end

  def new
    @zoo = Zoo.new
  end

  def create
    @zoo = current_user.zoos.build(zoo_params)
    if params[:back]
      render :new
    else
      if @zoo.save
        redirect_to zoo_path(id: @zoo.id), notice: "新しい動物園を登録しました！"
      else
        render :new
      end
    end
  end

  def show
    @favorite_zoo = current_user.favorite_zoos.find_by(zoo_id: @zoo.id)
  end

  def edit
    unless current_user.id == @zoo.user_id || current_user.admin == true
      redirect_to zoos_path, notice: "権限がありません！"
    end

  end

  def update
    if @zoo.update(zoo_params)
      redirect_to zoo_path(id: @zoo.id), notice: "動物園を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    unless current_user.id == @zoo.user_id || current_user.admin == true
      redirect_to zoos_path, notice: "権限がありません！"
    else
      @zoo.destroy
      redirect_to zoos_path, notice:"動物園を削除しました！"
    end
  end

  private
  def zoo_params
    params.require(:zoo).permit(
      :name,
      :address,
      :content,
      :photo,
      :summer_workday_open,
      :summer_workday_close,
      :winter_workday_open,
      :winter_workday_close,
      :summer_holiday_open,
      :summer_holiday_close,
      :winter_holiday_open,
      :winter_holiday_close,
      :general_price,
      :high_school_price,
      :junior_high_school_price,
      :primary_price,
      :senior_price,
      :price_comment,
      :holiday,
      :area,
      :prefecture,
      :home_page,
      :image_cache,
      { animal_ids: [] }
    )
  end

  def set_zoo
    @zoo = Zoo.find(params[:id])
  end

  def admin_user
    if current_user.admin != true
      redirect_to new_user_session_path, notice: "権限がありません！"
    end
  end
end
