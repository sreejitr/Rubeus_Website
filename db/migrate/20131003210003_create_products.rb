class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :description
      t.string :condition
      t.boolean :is_sold
      t.boolean :for_sale
      t.string :delete_for
      t.string :photo

      t.timestamps
    end
  end
end
