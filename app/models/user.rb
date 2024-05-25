class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable # Add :confirmable module

  has_one :profile, dependent: :destroy
  has_many :family_members
  has_many :people, through: :family_members

  accepts_nested_attributes_for :profile

  # Add this line to define the available roles
  ROLES = ["doctor", "client"]

  # Validate that the role is one of the available roles
  validates :role, inclusion: { in: ROLES }

  # Ensure the role is set to 'client' by default
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= "client"
  end

  # Custom validation to ensure karazin.ua email domain for provider role
  validate :karazin_email_for_provider

  private

  def karazin_email_for_provider
    if role == "doctor" && email !~ /@karazin\.ua\z/
      errors.add(:email, "must end with @karazin.ua for providers")
    end
  end

  def self.ransackable_associations(auth_object = nil)
    @ransackable_associations ||= reflect_on_all_associations.map { |a| a.name.to_s }
  end

  def self.ransackable_attributes(auth_object = nil)
    @ransackable_attributes ||= column_names + _ransackers.keys + _ransack_aliases.keys + attribute_aliases.keys
  end

end
