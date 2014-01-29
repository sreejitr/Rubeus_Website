class ModifiedUser < ActiveRecord::Migration
  def up
    add_column :users, :phone_no, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip_code, :string
  end

  def down
  end
end
