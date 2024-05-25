class Person < ApplicationRecord
  has_many :family_members, dependent: :destroy
  has_many :users, through: :family_members

  validates :first_name, :last_name, :patronym, :date_of_birth, :address, :phone_number,  presence: true
  def self.ransackable_associations(auth_object = nil)
    @ransackable_associations ||= reflect_on_all_associations.map { |a| a.name.to_s }
  end

  def self.ransackable_attributes(auth_object = nil)
    @ransackable_attributes ||= column_names + _ransackers.keys + _ransack_aliases.keys + attribute_aliases.keys
  end
  def full_name
    "#{first_name} #{last_name} #{patronym}"
  end
end
