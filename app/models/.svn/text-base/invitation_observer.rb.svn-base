class InvitationObserver < ActiveRecord::Observer
  def after_create(invitation)
    AccountMailer.deliver_invitation(invitation)
  end
end
