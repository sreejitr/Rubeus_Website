class RemoveBuyerIdColumn < ActiveRecord::Migration
  def change
    remove_column :products, :buyer_user_id
  end
end
