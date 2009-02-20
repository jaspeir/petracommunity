class GroupsController < ApplicationController
  before_filter :login_required
  
  def index
     @groups = Group.find(:all)
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }


  # TODO : Gruppenpfade lesbar machen
  def show
    @group = Group.find_by_title(params[:id]) || Group.find(params[:id])
  rescue  ActiveRecord::RecordNotFound
    render :text => "Gruppe nicht gefunden", :layout => true 
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(params[:group])
    @group.moderator_id = current_account.id
    if @group.save
      flash[:notice] = 'Group was successfully created.'
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end
  
  def join
    @group = Group.find(params[:id])
    @group.accounts << current_account
    @group.save
    redirect_to group_path(@group)
  end
end
