class AddColumninComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :author_id, :integer, null: false # user_id, duplicated name?
    add_column :comments, :post_id, :integer, null: false # post_id, to build an association? 
  end
end
