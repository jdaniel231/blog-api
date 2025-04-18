json.id @user.id
json.email @user.email
json.token request.env['warden-jwt_auth.token']
