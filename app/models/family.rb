class Family < ApplicationRecord
  has_meny :items
  #has_meny :users

  validates :name, presence: true
  validates :user_count, presence: true
end
