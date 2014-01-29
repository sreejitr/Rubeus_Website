class RemoveIsSoldColumn < ActiveRecord::Migration
  def change
    remove_column :products, :is_sold
  end
end
