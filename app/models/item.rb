class Item < ApplicationRecord


  validates :title, presence: true

  # Add photo uploader :image is same as in schema.rb
  mount_uploader :image, ImageUploader

end
