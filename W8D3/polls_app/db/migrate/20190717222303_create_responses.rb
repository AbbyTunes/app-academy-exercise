class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.integer :user_id, null: false      
      t.integer :question_id, null: false      
      t.integer :choice_id, null: false       
      t.timestamps
    end
  end
end