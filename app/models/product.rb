class Product < ApplicationRecord
    paginates_per 25


    has_many :line_items
    has_many :purchase_orders , through: :line_items


  def self.ransackable_attributes(auth_object = nil)
    %w[created_at description id title updated_at]
  end

end
