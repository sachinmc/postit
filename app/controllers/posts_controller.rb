class PostsController < ApplicationController
  def index
    # instance variables are available in the view template
    # renders the index template
    @posts = Post.all
  end

  def show
    # renders the show template
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = User.first # TODO: change once we have authentication

    if @post.save
      flash[:notice] = "Your post was created"
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private
  # strong parameters
  def post_params
    params.require(:post).permit(:title, :url, :description)
  end
end
