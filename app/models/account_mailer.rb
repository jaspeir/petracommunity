class AccountMailer < ActionMailer::Base
  default_url_options[:host] = 'www.poppster.de'
  
  #TODO : aufräumen und links mit url_for erzeugen
  
  def signup_notification(account)
    setup_email(account)
    @subject    += 'Anmeldung abschließen'
  
    @body[:url]  = "http://localhost:3000/activate/#{account.activation_code}"  
  end
  
  def activation(account)
    setup_email(account)
    @subject    += 'Dein Konto wurde aktiviert!'
    @body[:url]  = "http://localhost:3000/"
  end
  
  def invitation(invitation)
    setup_email(invitation)
    @subject        += 'Einladung'
    @body[:invitation] = invitation    
  end
  
  def friend_request(mail)
  end
  
  def message(message)
    @recipients = "#{message.recipient.email}"
    @from       = "notification@poppster.de"
    @subject    = "[Poppster] Neue Nachricht"
    @sent_on    = Time.now
    @body[:message] = message
  end
  
  
  protected
    def setup_email(account)
      @recipients  = "#{account.email}"
      @from        = "admin@poppster.de"
      @subject     = "[Poppster] "
      @sent_on     = Time.now
      @body[:account] = account
    end
end
