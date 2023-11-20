class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:index]


  def index
    @items = Item.where(family_id: current_user.family_id).where.not(user_id: nil)
  end

  def new
    @item_shop_category = ItemShopCategory.new
  end

  def create
    @item_shop_category = ItemShopCategory.new(item_shop_category_params)
    if @item_shop_category.valid?
      @item_shop_category.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def update
    checked_item_ids = params[:item_ids]
    if checked_item_ids.present?
      checked_item_ids.each do |item_id|
        item = Item.find_by(id: item_id)
        item.update(user_id: nil) if item.present?
      end
      redirect_to root_path
    end
  end

  def index_request
    @items = Item.where(family_id: current_user.family_id)
    @categories = Category.all
  end

  def update_request
    checked_item_ids = params[:item_ids]
    if checked_item_ids.present?
      checked_item_ids.each do |item_id|
        item = Item.find_by(id: item_id)
          item.update(user_id: current_user.id) if item.present?
        end
      end
      redirect_to root_path
  end

  def index_destroy
    @items = Item.where(family_id: current_user.family_id)
  end

  def destroy
    checked_item_ids = params[:item_ids]
    if checked_item_ids.present?
      checked_item_ids.each do |item_id|
        item = Item.find_by(id: item_id)
          item.destroy if item.present?
        end
      end
      redirect_to root_path
  end

  private

  def item_shop_category_params
    params.require(:item_shop_category).permit(:item_name, :unit_quantity, :price, :shop_name, :category_name, :remarks).merge(family_id: params[:family_id])
  end

end
