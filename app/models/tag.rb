class Tag < ApplicationRecord
  validates :name,
    presence: true,
    uniqueness: true,
    length: { maximum: 50 }

  has_many :taggings
  has_many :organisations, through: :taggings, source: :taggable,
            source_type: 'Organisation'
  has_many :missions, through: :taggings, source: :taggable,
            source_type: 'Mission'
end
