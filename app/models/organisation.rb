class Organisation < ApplicationRecord
  validates :name,
    presence: true,
    length: { in: 3..50 }
  validates :registration_number,
    presence: true,
    length: { maximum: 14 }
  validates :registration_date, presence: true
  validates :description,
    presence: true,
    length: { minimum:50, maximum: 10000 }


  belongs_to :user
  belongs_to :activity

  has_one :address, as: :addressable, dependent: :destroy
  has_one_attached :logo, dependent: :destroy

  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings
  has_many :missions, dependent: :destroy

  accepts_nested_attributes_for :address, allow_destroy: true

  def self.search(search, location)

    if search.present? && location.present?
      activity = Activity.find_by(title: search)
      address = Address.find_by(city: location.strip)
      if address.present?
        Organisation.all.select{|o| o if o.activity.title == activity.title && o.address.city.downcase == address.city.downcase}
      else
        Organisation.all
      end
    elsif search.present? && location.blank?
      activity = Activity.find_by(title: search)
      Organisation.all.select{|o| o if o.activity.title == activity.title}
    elsif search.blank? && location.present?
      address = Address.find_by(city: location.strip)
      if address.present?
        Organisation.all.select{|o| o if o.address.city.downcase == address.city.downcase}
      else
        Organisation.all
      end
    else
      Organisation.all
    end

  end

end
