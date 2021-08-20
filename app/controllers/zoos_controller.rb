class ZoosController < ApplicationController
  before_action :set_zoo, only: [:show, :edit, :update, :destroy]

  def index
    @zoos = Zoo.all
  end

  def new
    @zoo = Zoo.new
  end

  def create
    @zoo = Zoo.new(zoo_params)
    if params[:back]
      render :new
    else
      if @zoo.save
        redirect_to zoos_path, notice: "新しい動物園を登録しました！"
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @zoo.update(zoo_params)
      redirect_to zoos_path, notice: "動物園を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @zoo.destroy
    redirect_to zoos_path, notice:"動物園を削除しました！"
  end

  def confirm
    @zoo = Zoo.new(zoo_params)
    render :new if @zoo.invalid?
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
      :image_cache
    )
  end

  def set_zoo
    @zoo = Zoo.find(params[:id])
  end
end
