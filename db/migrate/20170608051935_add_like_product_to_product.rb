class AddLikeProductToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :like_product_totality, :integer
  end
end
