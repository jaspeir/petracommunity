class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end
  
  def create
    @invitation = Invitation.new(params[:invitation])
    @invitation.account_id = current_account.id
    @invitation.create_token
    if @invitation.save!
      flash[:notice] = "#{@invitation.email} wurde eingeladen"
      redirect_to :controller => "profiles", :action => "show"
    else
      render :action => "new"
    end
  end
  
  def index
    @invitations = Invitation.find_all_by_account_id(current_account)
  end
  
  def confirm
    session[:invitation_token] = params[:invitation_token]
    redirect_to :controller => "account", :action => "new"
  end
end
