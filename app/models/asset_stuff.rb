class AssetStuff < ApplicationRecord
  belongs_to :company_asset
  belongs_to :stuff

  enum status: { unassigned: 0, assigned: 1 }
  # Other model attributes and associations...

  # Set the default value for status
  after_initialize :set_default_status






  private

  def set_default_status
    # Set the default status to "assigned" if not already set
    self.status ||= :assigned
  end



end
