class ShoppingsController < ApplicationController
  def index
    @shoppings = Shopping.all
  end
end
