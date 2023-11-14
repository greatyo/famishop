class ItemsController < ApplicationController
  def index
    @items = Item.all
    @categories = Category.all
  end

  def new

  end

  def create
    
  end
end
