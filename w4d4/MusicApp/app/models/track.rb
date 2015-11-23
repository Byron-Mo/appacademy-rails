# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  song       :string           not null
#  track_type :string           not null
#  lyrics     :text
#  album_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
  validates :song, :track_type, :album_id, presence: true

  belongs_to :album
end
