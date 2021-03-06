class Challenge < ApplicationRecord
  mount_uploader :challenge_image, ChallengeImageUploader

  # Direct associations

  has_many   :teams,
             dependent: :destroy

  has_many   :privileges,
             dependent: :destroy

  has_many   :photos,
             class_name: "Photoworkout",
             dependent: :destroy

  has_many   :participations,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    starting_time
  end
end
