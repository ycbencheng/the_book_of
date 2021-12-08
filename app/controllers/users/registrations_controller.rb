class Users::RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?

    if resource.persisted?
      if resource.active_for_authentication?
        sign_up(resource_name, resource)

        respond_with resource
      else
        expire_data_after_sign_in!
        respond_with resource
      end
    else
      clean_up_passwords resource
      set_minimum_password_length

      respond_with resource
    end
  end

  private

  def respond_with(resource, _opts = {})
    register_success(resource) && return if resource.persisted?

    register_failed
  end

  def register_success(resource)
    token = resource.allowlisted_jwts.first.jti

    render json: { message: 'You successfuly created a user.',
                   token: token,
                   status: :success }
  end

  def register_failed
    render json: { status: :failed }
  end

  protected

  def sign_up_params
    params.require(:registration).permit(:first_name,
                                         :last_name,
                                         :email,
                                         :password)
  end
end
