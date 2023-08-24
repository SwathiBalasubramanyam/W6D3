class ArtWork < ApplicationRecord
    validates :title, uniqueness: { scope: :artist_id, message: 'Title should be unique'}

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :accessible_from,
        foreign_key: :art_work_id,
        class_name: :ArtWorkShare,
        dependent: :destroy

    has_many :users_shared,
        through: :accessible_from,
        source: :viewer
end