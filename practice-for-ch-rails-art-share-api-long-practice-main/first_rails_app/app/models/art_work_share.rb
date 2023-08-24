class ArtWorkShare < ApplicationRecord
    validates :art_work_id, uniqueness: { scope: :viewer_id, message: 'Art should be unique to a viewer'}
end