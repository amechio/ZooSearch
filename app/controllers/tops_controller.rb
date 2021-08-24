class TopsController < ApplicationController
  before_action :set_q

  def index
    @zoos = Zoo.all
    @animals = Animal.all
  end

  private
  
end
