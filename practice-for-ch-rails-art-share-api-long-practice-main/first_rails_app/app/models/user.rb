class User < ApplicationRecord

    has_many :art_works,
        foreign_key: :artist_id,
        class_name: :ArtWork,
        dependent: :destroy,
        inverse_of: :artist

    has_many :has_access_to,
        foreign_key: :viewer_id,
        class_name: :ArtWorkShare,
        dependent: :destroy,
        inverse_of: :viewer

    has_many :shared_artworks,
        through: :has_access_to,
        source: :art_work

    has_many :comments,
        foreign_key: :author_id,
        class_name: :Comment,
        dependent: :destroy,
        inverse_of: :author

    has_many :likes,
        foreign_key: :liker_id,
        class_name: :Like,
        dependent: :destroy,
        inverse_of: :liker

    has_many :collections,
        dependent: :destroy,
        inverse_of: :user 

    


    def self.users_by_username(username)
        self.where("username LIKE '%#{username}%' ")
    end

end
