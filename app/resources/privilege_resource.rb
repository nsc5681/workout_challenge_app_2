class PrivilegeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :challenge_id, :integer
  attribute :user_id, :integer

  # Direct associations

  belongs_to :challenge

  belongs_to :user

  # Indirect associations
end
