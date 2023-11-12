class Family < ApplicationRecord
  has_many :items
  has_many :users

  validates :name, presence: true
  validates :user_count, presence: true
end
