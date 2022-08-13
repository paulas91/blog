class AddNotNullConstraintToArticleUser < ActiveRecord::Migration[7.0]
  def change
    change_column_null :articles, :user_id, false
  end
end
