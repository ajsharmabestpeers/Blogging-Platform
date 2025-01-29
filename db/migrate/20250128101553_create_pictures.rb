class CreatePictures < ActiveRecord::Migration[7.1]
  def change
    create_table :pictures do |t|
      t.references :imageable, polymorphic: true, null: false
      t.string :image

      t.timestamps
    end
  end
end
