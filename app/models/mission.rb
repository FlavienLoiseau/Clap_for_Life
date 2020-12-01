class Mission < ApplicationRecord
  belongs_to :organisation

  has_one :address, as: :addressable

  has_many :participations
  has_many :users, through: :participations

  has_many :tags, as: :tagable

end
