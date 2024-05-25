class CreateTypeOfAnalyses < ActiveRecord::Migration[7.1]
  def change
    create_table :type_of_analyses do |t|
      t.string :name

      t.timestamps
    end
  end
end
