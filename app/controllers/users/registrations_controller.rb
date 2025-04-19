class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end

  def respond_with(resource, _opts = {})
    if resource.persisted?
      token = request.env['warden-jwt_auth.token']
      render json: {
        status: { code: 200, message: 'Registered successfully.' },
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes],
        authorization: token
      }, status: :ok
    else
      render json: {
        status: { message: "User couldn't be created. #{resource.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
    end
  end
end
