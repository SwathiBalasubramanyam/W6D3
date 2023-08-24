class ArtWorkShare < ApplicationRecord
    validates :art_work_id, uniqueness: { scope: :viewer_id, message: 'Art should be unique to a viewer'}

    belongs_to :art_work,
        foreign_key: :art_work_id,
        class_name: :ArtWork

    belongs_to :viewer,
        foreign_key: :viewer_id,
        class_name: :User

end