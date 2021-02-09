class FeatureMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.feature_mailer.feature_status_updated.subject
  #
  def feature_status_updated
    @user = params[:user]
    @feature = params[:feature]
    
    mail to: @user.email, subject: "The feature status is changed" 
  end
end
