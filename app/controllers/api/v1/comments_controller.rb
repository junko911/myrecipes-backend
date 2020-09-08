class Api::V1::CommentsController < ApplicationController
    def index
        comments = Comment.all
        render json: comments
      end
      
      def show
        commment = Comment.find(params:[id])
        render json: comment
      end

end
