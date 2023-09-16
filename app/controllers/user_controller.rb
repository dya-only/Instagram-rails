class UserController < ApplicationController
  before_action :authorize_request, :except => :create_user

  def create_user
    if User.find_by(email: params[:email]).nil?
      @user = User.new

      @user.email = params[:email]
      @user.name = params[:name]
      @user.username = params[:username]
      @user.password = params[:password]
      @user.avatar = params[:avatar]
      @user.bookmarks = '[]'
      @user.likes = '[]'
      @user.save

      render json: {
        success: true,
        body: @user
      }
    else
      render json: {
        success: false,
        message: '이메일이 이미 사용되었습니다.'
      }
    end
  end

  def find_all
    render json: {
      success: true,
      body: User.all
    }
  end

  def find_by_id
    render json: {
      success: true,
      body: User.find_by(id: params[:id])
    }
  end

  def find_by_name
    render json: {
      success: true,
      body: User.find_by(username: params[:username])
    }
  end

  def upload_avatar
    @id = params[:id]
    @avatar = params[:avatar]
    @user = User.find_by(id: @id)
    @user.avatar = @avatar
    @user.save

    render json: {
      success: true,
      body: @user
    }
  end
end