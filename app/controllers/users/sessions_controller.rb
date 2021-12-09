class Users::SessionsController < Devise::SessionsController
  def create
    @user = User.find_by(email: params['session']['email'])

    if @user.valid_password?(params['session']['password'])
      sign_in(:user, @user)
      respond_with(@user)
    end
  end

  private

  def respond_with(resource, _opts = {})
    token = resource.allowlisted_jwts.first.jti

    render json: { message: 'You are logged in.',
                   token: token,
                   status: :success }
  end

  def respond_to_on_destroy
    return log_out_success if !current_user

    log_out_failure
  end

  def log_out_success
    render json: { message: 'You are logged out.', status: :success }
  end

  def log_out_failure
    render json: { message: 'Hmm nothing happened.', status: :failed }
  end
end
