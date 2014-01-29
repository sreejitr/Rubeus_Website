class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :buyer_id
      t.integer :product_id

      t.timestamps
    end
    add_index :offers, [:product_id, :created_at]
  end
end
