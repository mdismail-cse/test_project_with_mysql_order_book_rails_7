class Position < ApplicationRecord
  belongs_to :department

  has_many :stuffs
end
