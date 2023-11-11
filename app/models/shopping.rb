class Shopping < ApplicationRecord
  belongs_to :item
  belongs_to :user
  #belongs_to :complete

  with_options presence: true do
    validates :item
    validates :quantity
  end

end
