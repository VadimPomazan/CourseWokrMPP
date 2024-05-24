class User < ApplicationRecord
  has_one :profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable # Add :confirmable module

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

  def self.ransackable_attributes(auth_object = nil)
    %w[id email created_at updated_at role] # Adjust this list based on your needs
  end

end
