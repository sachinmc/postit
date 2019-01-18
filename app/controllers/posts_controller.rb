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
  end

  def create
  end

  def edit
  end

  def update
  end 
end
