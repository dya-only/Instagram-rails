class ApplicationController < ActionController::API
  def authorize_request
    header = request.headers['Authorization']

    if header && header.starts_with?('Bearer ')
      token = header.split(' ')[1]

      begin
        decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
        @current_user = User.find_by(id: decoded_token['id'])

      rescue JWT::DecodeError => e
        render json: { message: '토큰이 잘못 되었습니다.' }, status: :unauthorized

      rescue ActiveRecord::RecordNotFound => e
        render json: { message: '해당 유저를 찾을 수 없습니다.' }, status: :unauthorized
      end

    else
      render json: { error:'토큰이 전달되지 않았습니다.' }, status: :unauthorized
    end
  end
end