class ArtWork < ApplicationRecord
    validates :title, uniqueness: { scope: :artist_id, message: 'Title should be unique'}
end