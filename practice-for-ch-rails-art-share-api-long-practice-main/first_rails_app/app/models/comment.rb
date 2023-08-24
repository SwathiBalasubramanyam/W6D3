class Comment < ApplicationRecord

    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User

    belongs_to :art_work,
        foreign_key: :art_work_id,
        class_name: :ArtWork

    has_many :likes, as: :likeable

    def self.comments_for_user_id(user_id)
        Comment
            .joins(:author)
            .where("author_id = #{user_id}")
    end

    def self.comments_for_art_work_id(art_work_id)
        Comment
            .joins(:art_work)
            .where("art_work_id = #{art_work_id}")
    end
end