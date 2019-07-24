class Artwork < ApplicationRecord

    validates :artist_id , uniqueness: { scope: :title }

    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artwork_shared,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare
    
    has_many :shared_viewers,
    through: :artwork_shared,
    source: :viewer
    
end