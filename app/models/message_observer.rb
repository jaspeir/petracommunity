class MessageObserver < ActiveRecord::Observer
  def after_create(message)
    AccountMailer.deliver_message(message)
  end
end
