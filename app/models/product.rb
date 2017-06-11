class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :comments
  belongs_to :category
  belongs_to :users

  #收藏
  has_many :product_relationships
  has_many :members, through: :product_relationships, source: :user

  #喜欢
  has_many :like_products
  has_many :liker, through: :like_products, source: :user

  #多图
  has_many :photos
  accepts_nested_attributes_for :photos

  #产品被喜欢的次数
  def liker_number
    liker.length
  end

end
