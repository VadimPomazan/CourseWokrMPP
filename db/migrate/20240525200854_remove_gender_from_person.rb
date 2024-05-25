class RemoveGenderFromPerson < ActiveRecord::Migration[7.1]
  def change
    remove_column :people, :gender, :string
  end
end
