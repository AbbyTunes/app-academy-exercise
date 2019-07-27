# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  title      :text             not null
#  year       :integer          not null
#  music_type :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  album_id   :integer          not null
#

class Album < ApplicationRecord

    # validates :album_id, uniqueness: {scope: :id}
    validates :name, uniqueness: { scope: :band_id }
    validates :title, :year, presence: true
    validates :music_type, inclusion: { in: [true, false] }

    belongs_to :band,
        primary_key: :id,
        foreign_key: :album_id,
        class_name: 'Band'
    
    has_many :tracks,
        primary_key: :id,
        foreign_key: :track_id,
        class_name: 'Track'
    
        
end
