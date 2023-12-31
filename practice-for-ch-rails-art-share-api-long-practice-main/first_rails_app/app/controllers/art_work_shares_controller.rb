class ArtWorkSharesController < ApplicationController

    def create
        aws = ArtWorkShare.new(artwork_share_params)
        if aws.save
            render json: aws, status: :created
        else
            render json: aws.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        aws = ArtWorkShare.find(params[:id])
        aws.destroy
        render json: aws
    end

    def favorite
        art_work_share = ArtWorkShare.find_by(art_work_id: params[:id], viewer_id: params[:user_id])
        art_work_share.update(favorite: true)
        render json: art_work_share
    end
    
    private
    def artwork_share_params
        params.require(:art_work_share).permit(:viewer_id, :art_work_id)
    end

end