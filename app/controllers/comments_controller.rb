# frozen_string_literal: true

# Service to download ftp files from the server
class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  before_action :set_usernames, only: %i[edit update]
  before_action :set_feature, only: %i[update destroy]
  def create
    @comment = Comment.new(comment_params)
    set_feature
    if @comment.save
      mail_comment
      redirect_to project_feature_path(@feature.project_id, @comment.feature_id),
                  flash: { success: 'new comment added' }
    end
  end

  def edit; end

  def update
    set_feature
    if @comment.update(comment_params)
      mail_comment
      redirect_to project_feature_path(@feature.project_id, @comment.feature_id), flash: { notice: 'comment updated' }
    end
  end

  def destroy
    @comment.destroy
    redirect_to project_feature_path(@feature.project_id, @comment.feature_id), flash: { notice: 'comment deleted' }
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_feature
    @feature = @comment.feature
  end

  def set_usernames
    @usernames = @comment.feature.users.pluck(:name).to_json.html_safe
  end

  def mail_comment
    @feature.users.each do |user|
      CommentMailer.with(feature: @feature, user: user, comment: @comment).comment_added_or_edited.deliver_later
    end
  end

  def comment_params
    params.require('comment').permit(:comment, :feature_id, :user_id)
  end
end
