class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:index]


  def index
    @items = Item.where(family_id: current_user.family_id).where.not(user_id: nil)
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

  def update
    # チェックボックスから送信されたアイテムのIDを取得
    checked_item_ids = params[:item_ids]

    # チェックされたアイテムがあればそれぞれのレコードを更新
    if checked_item_ids.present?
      checked_item_ids.each do |item_id|
        item = Item.find_by(id: item_id, user_id: current_user.id)
        # 特定のカラムを更新する例（user_idをnilに設定する）
        item.update(user_id: nil) if item.present?
      end
    end

    # リダイレクト先やフラッシュメッセージの設定など、適切な処理を行う

    # 例えば、更新後にアイテム一覧ページにリダイレクトする場合
    redirect_to index, notice: "選択されたアイテムが更新されました。"
  end

  private

  def item_shop_category_params
    params.require(:item_shop_category).permit(:item_name, :unit_quantity, :price, :shop_name, :category_name, :remarks).merge(family_id: params[:family_id])
  end

end
