class User < ApplicationRecord
  has_merit

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_one :address, as: :addressable, dependent: :destroy
  has_one :organisation
  has_one_attached :avatar

  has_many :participations
  has_many :missions, through: :participations

  accepts_nested_attributes_for :address, allow_destroy: true

end
