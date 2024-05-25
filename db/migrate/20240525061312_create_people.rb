class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :patronym
      t.string :phone_number
      t.string :address
      t.datetime :date_of_birth

      t.timestamps
    end
  end
end
