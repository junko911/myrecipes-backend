class Api::V1::CommentsController < ApplicationController
    def index
        comments = Comment.all
        render json: comments
      end
      
      def show
        commment = Comment.find(params:[id])
        render json: comment
      end

      def new
          comment = Comment.new
      end

      def create
        comment = Comment.create(comments_params)
      end 

      private
    
      def comments_params
        params.require(:comments).permit(:recipe_id, :user, :content)
      end 

end
