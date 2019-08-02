class ChangeColumnInComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :author, :post
    remove_index :comments, :author
  end
end
