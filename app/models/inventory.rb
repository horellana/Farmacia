class Inventory < ApplicationRecord
  belongs_to :subsidiary
  belongs_to :product
end
