class Item < ApplicationRecord

  has_many :category_items
  has_many :categories, through: :category_items

  validates :title, presence: true

  # Add photo uploader :image is same as in schema.rb
  mount_uploader :image, ImageUploader

end
