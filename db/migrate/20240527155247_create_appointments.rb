class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.bigint :user_id, null: false
      t.bigint :family_member_id, null: false
      t.bigint :order_id, null: false
      t.date :analysis_date, null: false
      t.time :analysis_time, null: false

      t.timestamps
    end
    add_index :appointments, :user_id
    add_index :appointments, :family_member_id
    add_index :appointments, :order_id

    add_foreign_key :appointments, :users
    add_foreign_key :appointments, :family_members
    add_foreign_key :appointments, :orders
  end
end
