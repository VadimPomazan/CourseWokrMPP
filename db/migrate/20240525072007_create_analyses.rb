class CreateAnalyses < ActiveRecord::Migration[7.1]
  def change
    create_table :analyses do |t|
      t.string :name
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
