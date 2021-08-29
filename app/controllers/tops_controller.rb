class TopsController < ApplicationController
  before_action :set_q
  before_action :set_p

  def index
    @zoos = Zoo.all
    # @q = Zoo.ransack(params[:q], search_key: :q)
    @zoos = @q.result

    @animals = Animal.all
    # @p = Animal.ransack(params[:p], search_key: :p)
    @animals = @p.result
  end

  def search
    index
    @zoos = @q.result
    @animals = @p.result
    render :index
  end

  private

  def set_q
    @q = Zoo.ransack(params[:q], search_key: :q)
  end

  def set_p
    @p = Animal.ransack(params[:p], search_key: :p)
  end
end
