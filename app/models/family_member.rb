class FamilyMember < ApplicationRecord
  belongs_to :user
  belongs_to :person

  validates :family_member_name, presence: true
  validate :user_must_be_client

  private

  def user_must_be_client
    errors.add(:user, "must be a client") unless user.role == "client"
  end

  def self.ransackable_associations(auth_object = nil)
    @ransackable_associations ||= reflect_on_all_associations.map { |a| a.name.to_s }
  end

  def self.ransackable_attributes(auth_object = nil)
    @ransackable_attributes ||= column_names + _ransackers.keys + _ransack_aliases.keys + attribute_aliases.keys
  end
end
