class User < ApplicationRecord
  has_many :orders
  has_many :products

  has_many :product_relationships
  has_many :relationship_products, :through => :product_relationships, :source => :product

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    is_admin
  end

  def join!(product)
    relationship_products << product
  end

  def quit!(product)
    relationship_products.delete(product)
  end

end
