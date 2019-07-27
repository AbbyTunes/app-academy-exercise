class AddAlbumId < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :album_id, :integer, null: false

    add_index :albums, :album_id, unique: true

    add_index :albums, :title, unique: true
    add_index :bands, :name, unique: true
    add_index :tracks, :title, unique: true
  end
end
