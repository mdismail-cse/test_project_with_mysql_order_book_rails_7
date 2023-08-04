class Department < ApplicationRecord

  # validates :title, uniqueness: true
  # validates :title, presence: true

  has_many :positions

end
