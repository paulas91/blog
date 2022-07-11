class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :year
      t.string :band

      t.timestamps
    end
  end
end
