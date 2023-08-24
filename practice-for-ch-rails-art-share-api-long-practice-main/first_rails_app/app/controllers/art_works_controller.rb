class ArtWorksController < ApplicationController

    def index
        render json: ArtWork.all
    end

    def show
        render json: ArtWork.find(params[:id])
    end

    def create
        art_work = ArtWork.new(art_work_params)
        if art_work.save
            render json: art_work, status: :created
        else
            render json: art_work.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        art_work = ArtWork.find(params[:id])
        art_work.update(art_work_params)
        redirect_to art_work_url(art_work)
    end

    def destroy
        art_work = ArtWork.find(params[:id])
        art_work.destroy
        render json: art_work
    end

    private
    def art_work_params
        begin
            params.require(:art_work).permit(:artist_id, :title, :image_url)   
        rescue => exception
            render json: exception.message, status: :unprocessable_entity
        end
    end

end