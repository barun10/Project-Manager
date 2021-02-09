class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @feature = @comment.feature
    if @comment.save
      @feature.users.each do |user|
        CommentMailer.with(feature: @feature, user: user, comment: @comment).comment_added_or_edited.deliver_later
      end
      redirect_to project_feature_path(@feature.project_id, @comment.feature_id)
    else
      redirect_to root_path
    end
  end
  def edit
    @comment = Comment.find(params[:id])
    @usernames = @comment.feature.users.pluck(:name).to_json.html_safe
  end

  def update
    @comment = Comment.find(params[:id])
    @usernames = @comment.feature.users.pluck(:name).to_json.html_safe
    @feature = @comment.feature
    if @comment.update(comment_params)
      @feature.users.each do |user|
        CommentMailer.with(feature: @feature, user: user, comment: @comment).comment_added_or_edited.deliver_later
      end
      redirect_to project_feature_path(@comment.feature.project_id, @comment.feature_id)
    else
      redirect_to root_path
    end
  end
  
  
  def destroy
    @comment = Comment.find(params[:id])
    @feature = @comment.feature
    @comment.destroy
    redirect_to project_feature_path(@feature.project_id, @comment.feature_id)
    flash[:notice] = 'Feature was successfully destroyed.'
  end
  
  private

  def comment_params
    params.require('comment').permit(:comment, :feature_id, :user_id)
  end
end
