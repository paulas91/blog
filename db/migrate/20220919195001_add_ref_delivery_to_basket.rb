class AddRefDeliveryToBasket < ActiveRecord::Migration[7.0]
  def change
    add_reference :baskets, :delivery, null: true, foreign_key: true
  end
end
