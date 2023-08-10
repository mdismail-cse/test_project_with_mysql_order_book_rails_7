class AssetStuff < ApplicationRecord
  belongs_to :company_asset
  belongs_to :stuff

  validates :assign_at, presence: true
  # validate :validate_asset_presence, on: :create
  validates_uniqueness_of :company_asset_id, conditions: -> { where(status: 'assigned') }

  enum status: { unassigned: 0, assigned: 1 }
  # Other model attributes and associations...

  # Set the default value for status
  after_initialize :set_default_status






  private

  def set_default_status
    # Set the default status to "assigned" if not already set
    self.status ||= :assigned
  end

  # def validate_asset_presence
  #
  #   if AssetStuff.where(company_asset_id: company_asset_id, status: 'assigned').exists?
  #     errors.add(:Asset ,"Already assign")
  #
  #   end
  # end
  #
  #

end
