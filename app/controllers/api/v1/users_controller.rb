class Api::V1::UsersController < ApiController
  # before_action :authenticate_request!, except: :create

  def index
    @users = User.all
  end

  def show
    @user = @current_user
    @posts = @current_user.posts
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: { status: 'User created successfully' }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def login
    user = User.find_by(email: params[:email].to_s.downcase)

    if user&.authenticate(params[:password])
      auth_token = JsonWebToken.encode({user_id: user.id})
      render json: {auth_token: auth_token}, status: :ok
    else
      render json: {error: 'Invalid username / password'}, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
