class PostsController < ApplicationController
  # before action is executing before every action
  # in this controller
  #
  # setting up instance variables that we need in the action - use case 1
  # second use case is to redirect, e.g: when we redirect the action won't be executed
  # put some conditional code in before_action to acheive that.
  before_action :set_post, only: [:show, :edit, :update]

  def index
    # instance variables are available in the view template
    # renders the index template
    @posts = Post.all
  end

  def show
    @comment = Comment.new
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

  def edit; end

  def update
    if @post.update(post_params)
      flash[:notice] = "This post was updated."
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private
  # strong parameters
  def post_params
    params.require(:post).permit(:title, :url, :description)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
