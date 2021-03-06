class ParticipationResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :challenge_id, :integer
  attribute :team_id, :integer

  # Direct associations

  belongs_to :team

  belongs_to :challenge

  belongs_to :user

  # Indirect associations
end
