class RenameForSaleAsStatus < ActiveRecord::Migration
  def change
    rename_column :products, :for_sale, :status
  end
end
