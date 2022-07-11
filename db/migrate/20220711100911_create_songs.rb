class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.text :body
      t.string :author

      t.timestamps
    end
  end
end
