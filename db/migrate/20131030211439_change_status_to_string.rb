class ChangeStatusToString < ActiveRecord::Migration
  def change
    change_column :products, :status, :string
  end
end
