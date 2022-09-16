class CreateBaskets < ActiveRecord::Migration[7.0]
  def change
    create_table :baskets do |t|
      t.integer :number_products
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
