class AddArtistRefToAlbums < ActiveRecord::Migration[7.0]
  def change
    add_reference :albums, :artist, null: true, foreign_key: true
  end
end
