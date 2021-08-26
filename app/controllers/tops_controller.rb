class TopsController < ApplicationController
  before_action :set_q
  before_action :set_p

  def index
    @zoos = Zoo.all
    @q = Zoo.ransack(params[:q])
    @zoos = @q.result

    @animals = Animal.all
    @p = Animal.ransack(params[:p])
    @animals = @p.result
  end

  def search
    index
    render :index
  end

  private

  def set_q
    @q = Zoo.ransack(params[:q])
  end

  def set_p
    @p = Animal.ransack(params[:p])
  end
end
