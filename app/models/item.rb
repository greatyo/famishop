class Item < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :shop
  belongs_to :category
  belongs_to :family
  #belongs_to :scomplete
end
