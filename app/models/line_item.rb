class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :purchase_order
  belongs_to :supplier
end
