class ItemShopCategory
  include ActiveModel::Model
  attr_accessor :item_name, :unit_quantity, :price, :remarks, :family, :category_name, :shop_name

  with_options presence: true do
    validates :item_name
    validates :unit_quantity
    validates :price
    validates :shop
    #validates :category
    #validates :family
    validates :category_name
    validates :shop_name
  end

#
#
#

end
