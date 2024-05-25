class FamilyMember < ApplicationRecord
  belongs_to :user
  belongs_to :person

  validates :family_member_name, presence: true
  validate :user_must_be_client

  private

  def user_must_be_client
    errors.add(:user, "must be a client") unless user.role == "client"
  end
end
