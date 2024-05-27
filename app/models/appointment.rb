# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :family_member
  belongs_to :order

  validates :analysis_datetime, presence: true

end
