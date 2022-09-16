class AddStateToBaskets < ActiveRecord::Migration[7.0]
  def change
    add_column :baskets, :state, :integer
  end
end
