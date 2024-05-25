class CreateFamilyMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :family_members do |t|
      t.references :user, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.string :family_member_name

      t.timestamps
    end
  end
end
