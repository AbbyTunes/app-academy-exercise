class CreateSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :subs do |t|
      t.string :title
      t.string :description
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :subs, :user_id
  end
end
