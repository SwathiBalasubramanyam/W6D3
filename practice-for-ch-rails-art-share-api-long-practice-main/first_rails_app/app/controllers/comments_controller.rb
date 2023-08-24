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
        params[:user_id] ? comments = Comment.comments_for_user_id(params[:user_id]) : comments = Comment.comments_for_art_work_id(params[:art_work_id])
        render json: comments
    end

    private
    def comments_params
        params.require(:comment).permit(:author_id, :art_work_id, :body)
    end
end