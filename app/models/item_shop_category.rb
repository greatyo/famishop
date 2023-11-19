class ItemShopCategory
  include ActiveModel::Model
  attr_accessor :item_name, :unit_quantity, :quantity, :price, :remarks, :family_id, :shop_id, :category_id, :user_id, :category_name, :shop_name


  with_options presence: true do
    validates :item_name
    validates :unit_quantity
    validates :price
    #validates :shop
    #validates :category
    validates :family_id
    validates :category_name
    validates :shop_name
  end

  def save
    category = Category.create(category_name: category_name)
    shop = Shop.create(shop_name: shop_name)
    family = Family.find(family_id)
    Item.create(item_name: item_name, unit_quantity: unit_quantity, price: price, 
                remarks: remarks, family_id: family.id, shop_id: shop.id, category_id: category.id)
  end

end


# quantity: quantity, user_id: user_id,