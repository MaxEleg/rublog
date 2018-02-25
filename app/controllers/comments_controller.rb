class CommentsController < ApplicationController
  before_action :comment_params, only: [:show, :edit, :new, :destroy]

  def new
    comment = Comment.new

    p params

    if signed_in?
      comment.createdBy = current_user.id
      comment.text = params[:text]
      comment.articleId = params[:articleId]
      comment.save

      print
    end

    if params[:articleId]
      redirect_to("/articles/" + params[:articleId])
    else
      redirect_to("/articles")
    end

  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:articleId)
    end
end