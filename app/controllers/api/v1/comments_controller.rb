class Api::V1::CommentsController < ApiController
  before_action :authenticate_request!, :load_user, :load_post

  def index
    puts(params)
    @comments = @post.comments
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    # @comment = comments.create!({ text: params[:text], user_id: @current_user.id})
    puts(params)
    @comment = Comment.create!({text: params[:text], post_id: @post.id, user_id: @current_user.id})
    puts("HERE IS COMMENT: #{@comment}")

    if @comment.save
      redirect_to action: :show, id: @comment.id
    end
  end

  private

  def load_user
    @user = User.find(params[:user_id]) if params[:user_id]
  end

  def load_post
    @post = Post.find(params[:post_id]) if params[:post_id]
    puts("HERE IS POST: #{@post}")
  end
end
