class Tag < ApplicationRecord
  has_many :taggings
  has_many :organisations, through: :taggings, source: :taggable,
            source_type: 'Organisation'
  has_many :missions, through: :taggings, source: :taggable,
            source_type: 'Mission'

end
