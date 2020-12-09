class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :email
      t.integer :money
      t.boolean :store_owner, default: false
      t.timestamps
    end
  end
end
