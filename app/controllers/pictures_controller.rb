class PicturesController < ApplicationController
  before_filter :login_required
  
  def index
    @pictures = current_account.pictures
  end

  def new
    @title = "Bilder Upload"
    @picture = Picture.new
  end
  
  def create
    @picture = current_account.pictures.build(params[:picture])
    @picture.approved = false
    if @picture.save
      redirect_to picture_path(@picture)
    else
      render :action => "new"
    end
  end
  
  def show
    @picture = Picture.find(params[:id])
    if @picture.nil?
      render :text => "Bild mit ID #{params[:id]} nicht vorhanden", :layout => true
      return
    end
    if @picture.thumbnail == 'thumb'
      @picture = @picture.parent
    end
    unless @picture.approved? || @picture.account == current_account
      render :text => "Bild wurde noch nicht geprüft", :layout => true
    end
  rescue  ActiveRecord::RecordNotFound
    render :text => "Bild nicht gefunden", :layout => true
  end
  
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to :action => "index"
  end
  
  def select_main
    @pictures = current_account.pictures.find_all_by_approved(true)
  end
  
  def select_as_main
    @picture = Picture.find(params[:id])
    unless @picture.approved?
      flash[:notice] = "Bild ist nicht freigegeben"
      render :action => "show"
      return
    end
    current_account.main_picture = @picture
    if current_account.save!
      redirect_to :controller => "profiles", :action => 'show'
    else
      flash[:notice] = "Profilbild konnte nicht gesetzt werden."
      redirect_to :action => "select_main"
    end
  end
end
