class CompanyAsset < ApplicationRecord
  belongs_to :asset_type

  has_many :asset_stuffs
  has_many :stuffs , through: :asset_stuffs


end
