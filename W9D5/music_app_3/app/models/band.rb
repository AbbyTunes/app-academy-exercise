# == Schema Information
#
# Table name: bands
#
#  id         :bigint           not null, primary key
#  name       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Band < ApplicationRecord

    validates :name, presence: true

    has_many :albums,
        primary_key: :id,
        foreign_key: :album_id,
        class_name: 'Album',
        dependent: :destroy # NEW
    
    has_many :tracks,
        through: :albums,
        source: :tracks,
        dependent: :destroy # NEW
    
        
end
