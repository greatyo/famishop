class Item < ApplicationRecord
  #has_meny :shoppings
  belongs_to :shop
  belongs_to :category
  belongs_to :family
end
