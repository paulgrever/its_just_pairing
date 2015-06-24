class Match < ActiveRecord::Base
  belongs_to :user

  enum status: %w(Potential Reject Pending Match)
  scope :pending, -> { where(status: 2) }
  scope :reject, -> { where(status: 1) }
  scope :matched, -> { where(status: 3) }
  # scope :liked, -> {where(person_b: current_user)}
end

