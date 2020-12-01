class Organisation < ApplicationRecord
  has_one :address, as: :addressable

  has_many :tags, as: :tagable

  belongs_to :user

  belongs_to :activity

  has_many :missions

end
