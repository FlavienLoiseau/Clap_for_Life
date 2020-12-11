class Activity < ApplicationRecord
  validates :code,
    presence: true,
    uniqueness: true,
    length: { minimum: 5, maximum: 30 }
  validates :title,
    presence: true,
    uniqueness: true,
    length: { minimum: 5, maximum: 30 }
  validates :description,
    presence: true,
    length: { maximum: 10000 }

  has_many :organisations
end
