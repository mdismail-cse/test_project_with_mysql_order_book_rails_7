class PurchaseOrder < ApplicationRecord
    has_many :line_items
    has_many :products, through: :line_items
    validates :total_price, presence: true





    def self.ransackable_attributes(auth_object = nil)
      %w[created_at id total_price updated_at]
    end

    def self.ransackable_associations(auth_object = nil)
        ['line_items', 'products', 'stuff']
    end
  
end
