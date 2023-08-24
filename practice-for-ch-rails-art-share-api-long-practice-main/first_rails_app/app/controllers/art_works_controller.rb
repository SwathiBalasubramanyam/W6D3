class ArtWorksController < ApplicationController

    def index
        render json: ArtWork.all
    end

    def show
        render json: ArtWork.find(params[:id])
    end

    def create
        
    end

    private
    def art_work_params
        params.require(:art_work).permit(:artist_id, :title, :image_url)
    end

end