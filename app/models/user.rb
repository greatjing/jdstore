class User < ApplicationRecord
  has_many :orders
  has_many :products

  has_many :product_relationships
  has_many :relationship_products, :through => :product_relationships, :source => :product

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

#判断是否管理员用户
  def admin?
    is_admin
  end

#判断是否已收藏
  def is_favorite?(product)
    relationship_products.include?(product)
  end

#收藏产品
  def join!(product)
    relationship_products << product
  end

#取消收藏
  def quit!(product)
    relationship_products.delete(product)
  end

end
