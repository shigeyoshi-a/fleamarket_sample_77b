class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?
  before_action :parents
  # rescue_from ActionController::RoutingError, with: :routing_error 
  # rescue_from Exception, with: :rescue_from_exception
  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found 
  
  # それぞれエラー表示された場合に表示するページへ移動する
  # 制作途中のためエラーの内容を表示するためコメントアウトにする
  
  # def record_not_found(e) 
  #   @exception = e
  #   render 'errors/record_not_found'
  # end 

  # def rescue_from_exception(e)
  #   @exception = e 
  #   render 'errors/500'
  # end 
  
  # def routing_error(e)
  #   @exception = e 
  #   render 'errors/routing_error'
  # end 

  def parents
    @parents = Category.where(ancestry: nil)
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name,:first_name,:family_name_reading,:first_name_reading,:birthday])
  end

  private
  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end
end
