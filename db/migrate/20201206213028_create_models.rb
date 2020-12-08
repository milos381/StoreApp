class CreateModels < ActiveRecord::Migration[6.0]
  def change
    create_table :models do |t|
      t.string :name_model
      t.integer :price

      t.timestamps
    end
  end
end
