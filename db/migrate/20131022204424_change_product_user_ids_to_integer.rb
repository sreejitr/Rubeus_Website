class ChangeProductUserIdsToInteger < ActiveRecord::Migration
  def change
    change_column :products, :seller_user_id,:integer
    change_column :products, :buyer_user_id, :integer
    # The lines below were used to deploy in Heroku:
    #execute 'ALTER TABLE products ALTER COLUMN seller_user_id TYPE integer USING (seller_user_id::integer)'
    #execute 'ALTER TABLE products ALTER COLUMN buyer_user_id TYPE integer USING (buyer_user_id::integer)'
  end
end
