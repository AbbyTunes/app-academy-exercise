class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      # doesn't have a foreign_key to Band yet, try add_column migration
      # add_index for album_id
      t.text :title, null: false
      t.integer :year, null: false
      t.boolean :music_type, null: false, default: true
      
      t.timestamps
    end
  end
end
