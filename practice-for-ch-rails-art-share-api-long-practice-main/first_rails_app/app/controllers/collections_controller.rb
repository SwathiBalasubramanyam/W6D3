class CollectionsController < ApplicationController
    def index
        render json: Collection.all
    end

    def create
        puts params
        render json: "You hit the right path"
    end

end