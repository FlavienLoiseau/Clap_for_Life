class Organisation < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  has_one :address, as: :addressable

  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings
  has_many :missions

  has_one_attached :logo
  has_one_attached :cover
  has_many_attached :images

  accepts_nested_attributes_for :tags
  accepts_nested_attributes_for :activity
  accepts_nested_attributes_for :address

  def self.search(search)
    if search
      tag = Tag.find_by(name: search)
      if tag
        Organisation.all.select{|o| o if o.tags.any? {|t| t.name == tag.name}}
      else
        Organisation.all
      end
    else
      Organisation.all
    end
  end





end
