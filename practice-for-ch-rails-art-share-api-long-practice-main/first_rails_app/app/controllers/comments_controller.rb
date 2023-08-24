class CommentsController < ApplicationController
    def create
        comment = Comment.new(comments_params)
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        render json: comment
    end

    def index
        if params[:user_id] or params[:art_work_id]
            render json: params[:user_id] ? Comment.comments_for_user_id(params[:user_id]) : Comment.comments_for_art_work_id(params[:art_work_id])
        else
            render json: "user_id or art_work_id needs to be specified", status: :unprocessable_entity
        end
    end

    private
    def comments_params
        params.require(:comment).permit(:author_id, :art_work_id, :body)
    end
end