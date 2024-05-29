# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :family_member
  belongs_to :order

  validates :analysis_datetime, presence: true

  enum status: { scheduled: 0, completed: 1, canceled: 2 }

  def cancel!
    canceled!
  end
  def self.ransackable_associations(auth_object = nil)
    @ransackable_associations ||= reflect_on_all_associations.map { |a| a.name.to_s }
  end

  def self.ransackable_attributes(auth_object = nil)
    @ransackable_attributes ||= column_names + _ransackers.keys + _ransack_aliases.keys + attribute_aliases.keys
  end
end
