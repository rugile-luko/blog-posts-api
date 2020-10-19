class Api::V1::PostsController < ApiController
  before_action :authenticate_request!, :load_user, :load_post

  def index
    @posts = @user ? @user.posts.by_q(params[:q]) : Post.all.by_q(params[:q])
  end

  def show
    @post = @user ? @user.posts.find(params[:id]) : Post.find(params[:id])
    @comments = @post.comments
  end

  def create
    puts(params)
    if @user == @current_user
      @post = @user.posts.create!({ title: params[:title], body: params[:body] })
    else
      return render json: { error: 'You do not have access to this action.' }, status: :unauthorized
    end

    if @post.save
      redirect_to action: :show, id: @post.id
    else
      render json: { error: 'Something went wrong.' }, status: :bad_request
    end
  end

  def edit
    @post = @current_user.posts.find(params[:id])
  end

  def update
    if @user == @current_user
      if @post.update({ title: params[:title], body: params[:body] })
        redirect_to action: :show, id: @post.id
      else
        render 'edit'
      end
    else
      render json: { error: 'You do not have access to this action.' }, status: :unauthorized
    end
  end

  def destroy
    if @user == @current_user
      @posts = @user.posts
      if @posts.exists?(params[:id])
        @posts.find(params[:id]).destroy
        redirect_to action: :index
      else
        render json: { error: 'Post does not exist.' }
      end
    else
      render json: { error: 'You do not have access to this action.' }, status: :unauthorized
    end
  end

  private

  def load_post
    @post = Post.find(params[:id]) if params[:id]
  end

  def load_user
    @user = User.find(params[:user_id]) if params[:user_id]
  end

end
