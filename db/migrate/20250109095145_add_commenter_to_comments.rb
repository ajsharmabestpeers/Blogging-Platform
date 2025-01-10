class AddCommenterToComments < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :commenter, :string
  end
end
