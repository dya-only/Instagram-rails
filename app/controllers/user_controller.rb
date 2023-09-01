class UserController < ApplicationController
  def getAll
    render json: User.all
  end

  def findById
    render json: User.find_by(id: params[:id])
  end

  def uploadAvatar
    @id = params[:id]
    @avatar = params[:avatar]

    @user = User.find_by(id: @id)
    @user.avatar = @avatar
    @user.save

    render json: @user
  end
end