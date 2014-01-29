class AddUserIds < ActiveRecord::Migration
  def up
    add_column :products, :seller_user_id,:string
    add_column :products, :buyer_user_id, :string
  end

  def down
  end
end
