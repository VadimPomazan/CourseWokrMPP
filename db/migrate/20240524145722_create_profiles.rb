class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :patronym
      t.string :tel
      t.string :address
      t.date :date_of_birth
      t.string :gender

      t.timestamps
    end
  end
end
