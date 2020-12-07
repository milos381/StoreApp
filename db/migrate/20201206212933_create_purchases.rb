class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.integer :phone_id
      t.integer :user_id

      t.timestamps
    end
  end
end
