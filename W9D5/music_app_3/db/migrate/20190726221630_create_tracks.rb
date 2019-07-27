class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.integer :track_id, null: false
      t.text :title, null: false
      t.integer :ord, null: false #track_number
      t.text :lyrics
      t.boolean :track_type, null: false, default: true
      
      t.timestamps
    end
  end
end