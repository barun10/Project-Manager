# Preview all emails at http://localhost:3000/rails/mailers/feature_mailer
class FeatureMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/feature_mailer/feature_status_updated
  def feature_status_updated
    FeatureMailer.with(feature: Feature.find(69), user: Feature.find(69).users).feature_status_updated
  end

end
