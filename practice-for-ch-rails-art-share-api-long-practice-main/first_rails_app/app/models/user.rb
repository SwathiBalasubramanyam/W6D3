class User < ApplicationRecord

    has_many :art_works,
        foreign_key: :artist_id,
        class_name: :ArtWork

    has_many :has_access_to,
        foreign_key: :viewer_id,
        class_name: :ArtWorkShare,
        dependent: :destroy

    has_many :shared_artworks,
        through: :has_access_to,
        source: :art_work
    
end
