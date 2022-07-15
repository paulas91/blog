class CreateArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :body
      t.string :music_style

      t.timestamps
    end
  end
end
