class Organisation < ApplicationRecord
  has_one :address, as: :addressable

  has_many :tags, as: :tagable

  belongs_to :user

  belongs_to :activity

  has_many :missions

  has_one_attached :logo
  has_one_attached :cover
  has_many_attached :images

  accepts_nested_attributes_for :tags
  accepts_nested_attributes_for :activity
  accepts_nested_attributes_for :address




end
