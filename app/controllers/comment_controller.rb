class CommentController < ApplicationController
  def create_comment
    @comment = Comment.new

    @comment.author = params[:author]
    @comment.post_id = params[:post_id]
    @comment.content = params[:content]
    @comment.likes = 0
    @comment.save

    render json: {
      success: true,
      body: @comment
    }
  end

  def find_all
    @comment = Comment.all

    render json: {
      success: true,
      body: @comment
    }
  end

  def find_by_post
    @comment = Comment.where(post_id: params[:post_id])

    if !@comment.nil?
      render json: {
        success: true,
        body: @comment
      }
    else
      render json: {
        success: false,
        message: '댓글을 찾을 게시물을 찾지 못했어요.'
      }
    end
  end

  def delete_comment
    @comment = Comment.find_by(id: params[:id])

    render json: {
      success: true,
      body: @comment
    }

    Comment.find_by(id: params[:id]).destroy
  end
end