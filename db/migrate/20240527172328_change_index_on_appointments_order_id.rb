class ChangeIndexOnAppointmentsOrderId < ActiveRecord::Migration[7.1]
  def change
    remove_index :appointments, :order_id
    add_index :appointments, :order_id, unique: true
  end
end
