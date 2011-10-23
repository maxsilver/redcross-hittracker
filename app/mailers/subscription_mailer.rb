class SubscriptionMailer < ActionMailer::Base
  default from: "media-hit-tracker@ggr.redcross.org"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscription_mailer.new_hit.subject
  #
  def new_hit(hit, user)
    @greeting = "A new Hit has been created in the system"
    @hit = hit

    mail to: user.email
  end
end
