class Organisation < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  has_one :address, as: :addressable, dependent: :destroy

  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings
  has_many :missions, dependent: :destroy

  has_one_attached :logo
  has_one_attached :cover
  has_many_attached :images

  accepts_nested_attributes_for :address, allow_destroy: true

  def self.search(search, location)
 

    if search.present? && location.present?
      tag = Tag.find_by(name: search)
      address = Address.find_by(city: location.strip)
      if address.present?
        Organisation.all.select{|o| o if o.tags.any? {|t| t.name == tag.name} && o.address.city.downcase == address.city.downcase}
      else
        Organisation.all
      end
    elsif search.present? && location.blank?
      tag = Tag.find_by(name: search)
      Organisation.all.select{|o| o if o.tags.any? {|t| t.name == tag.name}}
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
