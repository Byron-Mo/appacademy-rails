class Note < ActiveRecord::Base
  validates :user_id, :track_id, :text, presence: true

  belongs_to :track
  belongs_to :user
end
