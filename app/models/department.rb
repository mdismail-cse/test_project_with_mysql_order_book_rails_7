class Department < ApplicationRecord

  validates :title, presence: true, uniqueness: true


  has_many :positions

end
