class CommentController < ApplicationController
  def new
  # Auto-fill the commenter's name if it has been stored in a cookie
  @comment = Comment.new(author: cookies[:commenter_name])
  end


def create
  @comment = Comment.new(comment_params)
  if @comment.save
    if params[:remember_name]

      # save the controler's name in a cookie
    else
      # Delete cookie for the commenter's naame, if any.
      cookies.delete(:commenter_name)
    end

    redirect_to @comment.article
  else
    render action: "new"
  end
end
end
