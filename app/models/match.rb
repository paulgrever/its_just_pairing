class Match < ActiveRecord::Base
  belongs_to :user
  enum status: %w(Potential Reject Pending Match)
end
