class Position < ApplicationRecord

  belongs_to :department

  has_many :stuffs

  validates :post_name, presence: true
  validates :department_id, presence: true



end
