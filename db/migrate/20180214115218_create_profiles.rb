class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.date :birthday_date
      t.integer :cbo
      t.integer :document
      t.string :blood_type
      t.text :address
      t.string :city
      t.string :phone_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
