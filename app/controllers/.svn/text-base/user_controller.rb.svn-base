class UserController < ApplicationController

  def login
  end

  def create
    self.current_account = Account.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        self.current_account.remember_me
        cookies[:auth_token] = { :value => self.current_account.remember_token , :expires => self.current_account.remember_token_expires_at }
      end
      LoginInfo.new(:account_id => current_account.id, :header => request.env).save!
      redirect_back_or_default('/')
      flash[:notice] = "Hallo #{self.current_account.login}"
    else
      if params[:login] && Account.find_by_login(params[:login]).activated_at.nil?
        flash[:notice] = "Login wurd noch nicht aktiviert"
      elsif params[:login] && params[:password]
        flash[:notice] = "Login/Passwort falsch!"
      end
      render :action => 'login'
    end
  end

  def destroy
    self.current_account.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "Ciao #{self.current_account.login}, bis zum nächsten Mal."
    redirect_back_or_default('/')
  end
end
