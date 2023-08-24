class Comment < ApplicationRecord
    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User

    belongs_to :art_work,
        foreign_key: :art_work_id,
        class_name: :ArtWork

end