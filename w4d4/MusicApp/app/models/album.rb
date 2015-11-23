# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  recordd    :string           not null
#  album_type :string           not null
#  band_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base
  validates :recordd, :album_type, :band_id, presence: true
  validates :recordd, uniqueness: true

  belongs_to :band
end
