class AuthController < ApplicationController
  def login
    @email = params[:email]
    @password = params[:password]
    @user = User.find_by(email: @email)

    if @user && @user.password == @password
      @token = encode_token(@user.id)

      render json: {
        success: true,
        token: @token
      }
    else
      render json: {
        success: false,
        message: '이메일 또는 비밀번호가 틀렸습니다.'
      }
    end
  end

  def verify
    @token = params[:token]

    begin
      render json: {
        success: true,
        body: JWT.decode(@token, Rails.application.secrets.secret_key_base)[0]
      }
    rescue
      render json: {
        success: false
      }
    end
  end

  def encode_token(id)
    payload = { id: id, exp: (Time.now + 3.day).to_i }
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
end