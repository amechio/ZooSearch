class TopsController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    @zoos = Zoo.all
    @animals = Animal.all

  end

  def search
    @results = @q.result
  end

  private
  def set_q
    @q = Zoo.ransack(params[:q])
  end
end
