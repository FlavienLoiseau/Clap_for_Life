class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_one :address, as: :addressable, :dependent => :destroy

  has_one :organisations

  has_many :participations
  has_many :missions, through: :participations

  has_one_attached :avatar

  accepts_nested_attributes_for :address

end
