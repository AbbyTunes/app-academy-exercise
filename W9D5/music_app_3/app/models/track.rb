# == Schema Information
#
# Table name: tracks
#
#  id         :bigint           not null, primary key
#  track_id   :integer          not null
#  title      :text             not null
#  ord        :integer          not null
#  lyrics     :text
#  track_type :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord

    validates :track_id, :title, :ord, presence: true
    validates :track_type, inclusion: { in: [true, false] }
    validates :ord, uniqueness: {scope: :album_id} 
    # use the foreign key, not{scope: :id}
    # validates :track_id, uniqueness: {scope: :id} # No in solution

    belongs_to :album,
        primary_key: :id,
        foreign_key: :track_id,
        class_name: 'Album'
    
    has_one :band,
        through: :album,
        source: :band
end

#  Can you tell me something about the Model - scope validation? 

# class Track < ApplicationRecord
#     validates :track_id, uniqueness: {scope: :id}
#  	meaning within one track_id, can only have one album?
#  	would the order matter?
#  	should I match :id with :track_id, or :title?

# same as track:
# class Track < ApplicationRecord
#  	validates :album_id, uniqueness: {scope: :id}