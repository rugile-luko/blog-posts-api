module ControllerHelpers
  def log_in(user)
    post '/api/v1/users/login', params: { email: user.email, password: user.password }
    puts("LOG IN FUNCTION USER: #{user.email}")
  end
end