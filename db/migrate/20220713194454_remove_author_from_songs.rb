class RemoveAuthorFromSongs < ActiveRecord::Migration[7.0]
  def change
    remove_column :songs, :author
  end
end
