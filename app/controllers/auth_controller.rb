class AuthController < ApplicationController
  def sign_up
    if User.find_by(email: params[:email]).nil?
      @user = User.new

      @user.email = params[:email]
      @user.name = params[:name]
      @user.username = params[:username]
      @user.password = params[:password]
      @user.avatar = params[:avatar]
      @user.save

      render json: { message: @user }, status: :ok
    else
      render json: { message: '이메일이 이미 사용되었습니다.' }, status: :unauthorized
    end
  end

  def login
    @email = params[:email]
    @password = params[:password]

    create_token(@email, @password)
  end

  def create_token(email, password)
    user = User.find_by(email: email)

    if user && user.password == password
      token = encode_token(user.id, user.email, user.username)
      render json: { token: token }, status: :ok
    else
      render json: { message: '이메일 또는 비밀번호가 틀렸습니다.' }, status: :unauthorized
    end
  end

  private

  def encode_token(id, email, username)
    payload = { id: id, email: email, username: username }
    expires_in = 3.day

    JWT.encode(payload, Rails.application.secrets.secret_key_base, exp: Time.now.to_i + expires_in)
  end
end