class CommentsController < ApplicationController
  
  def index
    @comment_topics = current_user.favorite_topics
  end

  def create
    @comment = current_user.comments.new(comment_params)
    #binding.pry
    if @comment.save
      redirect_to topics_path, success: 'コメントを投稿しました'
    else
      redirect_to topics_path, danger: 'コメントの投稿に失敗しました'
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :topic_id)
  end
  
end
