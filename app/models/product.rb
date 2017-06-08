class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :comments
  belongs_to :category
  belongs_to :users

  has_many :product_relationships
  has_many :members, through: :product_relationships, source: :user

  has_many :like_products
  has_many :liker, through: :like_products, source: :user


end
