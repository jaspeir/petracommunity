class AccountController < ApplicationController
  before_filter :login_required, :except => [:new, :create, :activate]
  before_filter :check_invitation, :only => [:new]
  
  # render new.rhtml
  def new
    @account = Account.new
    @account.email = @invitation.email
  end

  def create
    cookies.delete :auth_token
    check_invitation
    reset_session
    @account = Account.new(params[:account])
    @account.sponsor = @invitation.account
    @initial_group = Group.find_by_title('Braunschweig')
    @initial_group.accounts << @account
    @account.save!
    @invitation.invited_account = @account
    @invitation.save!
    redirect_back_or_default('/')
    flash[:notice] = "Vielen Dank, dass Du Dich bei Poppster angemeldet hast. Bitte schau nun in Dein E-Mail-Postfach!"
  rescue ActiveRecord::RecordInvalid
    render :action => 'new'
  end

  def activate
    self.current_account = params[:activation_code].blank? ? :false : Account.find_by_activation_code(params[:activation_code])
    if logged_in? && !current_account.activated?
      current_account.activate
      flash[:notice] = "Anmeldung abgeschlossen!"
    end
    redirect_to :controller => "profiles", :action => 'show'
  end

  def edit
    @account = current_account
  end

  def update
    @account = current_account
    if @account.update_attributes(params[:account])
      redirect_to :controller => "profile"
    else
      render :action => "edit"
    end
  end
  
  def show
    redirect_to :controller => "profile"
  end
  
  private
  
  def check_invitation
    @invitation = Invitation.find_by_invitation_token(session[:invitation_token])
    if @invitation.nil?
      redirect_to tmp_invite_only_path
    end
  end
end
