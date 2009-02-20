class FriendshipsController < ApplicationController
  before_filter :login_required, :setup_friends
  
  def index
    @requested = current_account.requested_friends.size
    @friends = current_account.friends
  end
  
  def show
    if params[:id] == 'show_requested'
      @friends = current_account.requested_friends
    elsif params[:id] == 'show_accepted'
      @friends = current_account.friends
    end    
  end
  
  # Send a friend request.
  # We'd rather call this "request", but that's not allowed by Rails.
  def create
    Friendship.request(@account, @friend)
    flash[:notice] = "#{@friend.login} wurde benachrichtigt"
    redirect_to :controller => "profiles",
                :action => "show", 
                :id => @friend.login 
  end

  def accept
    if @account.requested_friends.include?(@friend)
      Friendship.accept(@account, @friend)
      flash[:notice] = "Friendship with #{@friend.login} accepted!"
    else
      flash[:notice] = "No friendship request from #{@friend.login}."
    end
    redirect_to :controller => "profiles", :action => "show"  
  end
  
  def decline
    if @account.requested_friends.include?(@friend)
      Friendship.breakup(@account, @friend)
      flash[:notice] = "Friendship with #{@friend.screen_name} declined"
    else
      flash[:notice] = "No friendship request from #{@friend.screen_name}."
    end
    redirect_to hub_url
  end
  
  def cancel
    if @account.pending_friends.include?(@friend)
      Friendship.breakup(@account, @friend)
      flash[:notice] = "Friendship request canceled."
    else
      flash[:notice] = "No request for friendship with #{@friend.screen_name}"
    end
    redirect_to hub_url
  end
  
  def delete
    if @account.friends.include?(@friend)
      Friendship.breakup(@account, @friend)
      flash[:notice] = "Friendship with #{@friend.screen_name} deleted!"
    else
      flash[:notice] = "You aren't friends with #{@friend.screen_name}"
    end
    redirect_to hub_url
  end

  private 
  
  def setup_friends
    @account = current_account
    @friend = Account.find_by_login(params[:id]) if params[:id]
  end
  
end
