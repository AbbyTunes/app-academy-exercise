class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.integer :ord, null: false
      t.integer :album_id, null: false
      t.text :lyrics
      t.boolean :bonus, null: false, default: false

      t.timestamps
    end
    add_index :tracks, [:album_id, :ord], unique: true
  end
end
