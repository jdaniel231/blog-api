class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  
  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      token = request.env['warden-jwt_auth.token'] # Obtém o token JWT gerado pelo Devise JWT
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