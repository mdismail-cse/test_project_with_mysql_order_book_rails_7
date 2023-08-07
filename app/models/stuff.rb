class Stuff < ApplicationRecord

  belongs_to :role
  belongs_to :position

  has_one_attached :profile_image
  paginates_per 10

  has_many :asset_stuffs
  has_many :company_assets, through: :asset_stuffs


  validate :remove_bd_country_code_from_phone_number, on: :create
  validates :phone_number, uniqueness: true
  validates :email, :phone_number, :position, :name, presence: true



  devise :database_authenticatable,
  :recoverable, :rememberable, :validatable





  def self.ransackable_attributes(auth_object = nil)
    %w[created_at email id role_id updated_at]
  end


  def remove_bd_country_code_from_phone_number
    bd_pattern = /^(\+8801|8801|01|008801)[1|3-9]{1}\d{8}$/
    if phone_number && phone_number.match(bd_pattern)
      bd_country_code = /\+88/
      if phone_number.match(bd_country_code)
        remove_code = '+88'
        self.phone_number = phone_number.sub(remove_code, '')
      end
    else
      errors.add(:phone_number, "is not a valid Bangladeshi phone number or been taken")
    end
  end



end
