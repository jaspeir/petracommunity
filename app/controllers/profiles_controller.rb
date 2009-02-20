class ProfilesController < ApplicationController
  before_filter :login_required
  
  def index
    @accounts = Account.find(:all)
  end
  
  def show
    @account = Account.find_by_login(params[:id]) || current_account
    @spec = @account.spec
    @pictures = @account.pictures
    
    unless @spec.nil?
      @location = @spec.location 
      @map = GMap.new("map_div")
      @map.control_init(:large_map => false,:map_type => false)
      @map.center_zoom_init(@location,7)
      @map.overlay_init(GMarker.new(@location,
                                      :title => "Home", 
                                      :info_window => @account.login ))
    end
  end
end
