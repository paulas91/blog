class ChangeUsersEmailDefaultAndNullConstraints < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :email, :integer, default: "", null: false
  end
end
