class LikesController < ApplicationController

    def index
        if params[:comment_id]
            render json: Like.where(likeable_id: params[:comment_id], 
            likeable_type: :Comment)
        else
            render json: Like.where(likeable_id: params[:art_work_id], 
            likeable_type: :ArtWork)
        end
    end
end