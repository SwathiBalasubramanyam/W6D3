class ArtWork < ApplicationRecord
    validates :title, uniqueness: { scope: :artist_id, message: 'and artist_id should be unique'}

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :accessible_from,
        foreign_key: :art_work_id,
        class_name: :ArtWorkShare,
        dependent: :destroy,
        inverse_of: :art_work

    has_many :shared_viewers,
        through: :accessible_from,
        source: :viewer


    def self.artworks_for_user_id(user_id)
        self
            .distinct
            .left_joins(:shared_viewers)
            .where("users.id = #{user_id} 
                    or art_works.artist_id = #{user_id}")
    end
end