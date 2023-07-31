class PurchaseOrder < ApplicationRecord
    has_many :line_items
    has_many :products, through: :line_items





    def self.ransackable_attributes(auth_object = nil)
      %w[created_at id total_price updated_at]
    end
  
  
  
end
