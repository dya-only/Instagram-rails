class PostController < ApplicationController
  before_action :authorize_request

  def create_post
    @post = Post.new

    if !params[:img] || !params[:content]
      render json: {
        success: false,
        message: '이미지 또는 내용이 작성되지 않았어요.'
      }
      return
    end

    @post.author = params[:author]
    @post.img = params[:img]
    @post.content = params[:content]
    @post.likes = 0
    @post.comments = '[]'
    @post.save

    render json: {
      success: true,
      body: @post
    }
  end

  def find_all
    @post = Post.all

    render json: {
      success: true,
      body: @post
    }
  end

  def find_by_id
    @post = Post.find_by(id: params[:id])

    if !@post.nil?
      render json: {
        success: true,
        body: @post
      }
    else
      render json: {
        success: false,
        message: '게시물을 찾지 못했어요.'
      }
    end
  end

  def find_my_post
    @posts = Post.where(author: params[:author])

    render json: {
      success: true,
      body: @posts
    }
  end
end