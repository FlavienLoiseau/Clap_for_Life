class Address < ApplicationRecord
  validates :number,
    presence: true,
    length: { maximum: 10 }
  validates :street,
    presence: true,
    length: { minimum: 5, maximum: 50 }
  validates :city,
    presence: true,
    length: { maximum: 30 }
  validates :zipcode,
    presence: true,
    length: { maximum: 20 }
  validates :country,
    presence: true,
    length: { maximum: 30 }

  belongs_to :addressable, polymorphic: true
end
