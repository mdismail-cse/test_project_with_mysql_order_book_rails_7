class Stuff < ApplicationRecord

  has_one_attached :profile_image
  paginates_per 10

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
  :recoverable, :rememberable, :validatable
#  validates :role_id, presence: true
  belongs_to :role
  belongs_to :position



  def self.ransackable_attributes(auth_object = nil)
    %w[created_at email id role_id updated_at]
  end


end
