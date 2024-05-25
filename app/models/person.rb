class Person < ApplicationRecord
  has_many :family_members
  has_many :users, through: :family_members


end
