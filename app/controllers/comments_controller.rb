class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    # also sets comments post_id to this post object.
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    # hard code the user id for now
    @comment.creator = User.first # TODO: fix after authentication 

    if @comment.save
      flash[:notice] = 'Your comment was added.'
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end
end
