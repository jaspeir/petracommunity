class MessagesController < ApplicationController
  before_filter :login_required
  
  def send_to
    @message = Message.new
    @message.recipient = Account.find(params[:id])
    @message.sender = current_account
    session[:recipient_id] = @message.recipient.id
  end
  
  def create
    @message = Message.new(params[:message])
    @message.recipient = Account.find(session[:recipient_id])
    @message.sender = current_account
    @message.save!
    redirect_to :controller => "profiles", 
                :action => "show", 
                :id => @message.recipient.login 
  end
  
  def index
    @messages = Message.find_all_by_recipient_id(current_account.id)
  end
  
  def show
    @message = Message.find(params[:id])
  end
end
