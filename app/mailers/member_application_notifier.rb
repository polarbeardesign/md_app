class MemberApplicationNotifier < ActionMailer::Base
  default :from => "membership_application@marshallingdetachment.org"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.roster_notifier.created.subject
  #
  def created(member)
    @member = member

      if Rails.env.production?
        mail :to => member.user.email, 
             :cc => 'info@marshallingdetachment.org', 
             :subject => 'Detachment Membership Application Received'
      else
        mail :to => member.user.email, 
             :subject => 'Detachment Membership Application Received'
      end
  end

end