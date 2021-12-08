class ApplicationController < ActionController::API
  before_action :current_user

  def current_user
    sessions = controller_name == 'sessions'
    registrations = controller_name == 'registrations'
    list = devise_controller? || sessions || registrations
    return false if list

    token = request.headers['Authorization']

    AllowlistedJwt.find_by(jti: token).user
  end
end
