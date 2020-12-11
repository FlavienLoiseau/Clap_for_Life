class User < ApplicationRecord
  validates :first_name,
    length: { maximum: 30 }
  validates :last_name,
    length: { maximum: 30 }
  validates :username,
    length: { maximum: 30 }
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "L'email n'est pas au bon format" }
  validates :phone_number,
    length: { maximum: 15 }

  has_merit

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_one :address, as: :addressable, dependent: :destroy
  has_one :organisation, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy

  has_many :participations
  has_many :missions, through: :participations

  accepts_nested_attributes_for :address, allow_destroy: true

  scope :admin, -> { where(admin: true) }

end
