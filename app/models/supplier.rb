# frozen_string_literal: true
class Supplier < ApplicationRecord
  paginates_per 20

  has_many :line_items
  has_many :product_suppliers
  has_many :products , through: :product_suppliers


  def self.ransackable_attributes(auth_object = nil)
    %w[created_at id name updated_at]
    end
    

end
