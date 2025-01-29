class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :interest
      t.integer :age
      t.date :dob
      t.string :city
      t.text :bio

      t.timestamps
    end
  end
end
