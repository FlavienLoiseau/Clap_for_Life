class Mission < ApplicationRecord
  belongs_to :organisation

  has_one :address, as: :addressable, dependent: :destroy

  has_many :participations
  has_many :users, through: :participations

  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings

  has_one_attached :cover
  has_many_attached :images

  accepts_nested_attributes_for :address

  require 'active_support/core_ext'
  def self.search(search, location, date)

    if search.present? && location.present? && date.present?
      tag = Tag.find_by(name: search)
      address = Address.find_by(city: location.strip.capitalize)
      search_date= date.to_date
      if address.present?
        Mission.all.select{|m| m if m.tags.any? {|t| t.name == tag.name} && m.address.city.downcase == address.city.downcase && m.start_date.to_date >= search_date}
      else
        Mission.all
      end
    elsif search.present? && location.blank? && date.present?
      tag = Tag.find_by(name: search)
      search_date= date.to_date
      Mission.all.select{|m| m if m.tags.any? {|t| t.name == tag.name} && m.start_date.to_date >= search_date}
    elsif search.present? && location.blank? && date.blank?
      tag = Tag.find_by(name: search)
      Mission.all.select{|m| m if m.tags.any? {|t| t.name == tag.name}}
    elsif search.blank? && location.present? && date.present?
      address = Address.find_by(city: location.strip.capitalize)
      search_date= date.to_date
      if address.present?
        Mission.all.select{|m| m if m.address.city.downcase == address.city.downcase && m.start_date.to_date >= search_date}
      else
        Mission.all
      end
    elsif search.blank? && location.blank? && date.present?
      search_date= date.to_date
      Mission.all.select{|m| m if m.start_date.to_date >= search_date}   
    else
      Mission.all
    end
      

  end

  def self.street(id)
    Mission.find(id).address.street.split(" ").flat_map { |x| [x, "%20"] }[0...-1].join(" ")
  end

end
