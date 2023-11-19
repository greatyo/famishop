class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:index]


  def index
    @items = Item.where(family_id: current_user.family_id)
    #@items = Item.where(family_id: current_user.family_id,).not(user: nil)  itemが自分のfamilyかつuserが入っていて買い物登録されているを取り出せるか？
    @categories = Category.all
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

  private

  def item_shop_category_params
    params.require(:item_shop_category).permit(:item_name, :unit_quantity, :price, :shop_name, :category_name, :remarks).merge(family_id: params[:family_id])
  end

end
