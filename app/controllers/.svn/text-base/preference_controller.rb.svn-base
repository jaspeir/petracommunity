class PreferenceController < ApplicationController
  def edit
    @preference = current_account.preference || current_account.build_preference
  end
  
  def update
    @preference = current_account.preference || current_account.build_preference
    if @preference.update_attributes(params[:preference])
      redirect_to :controller => "profiles", :action => "show"
    else
      flash[:notice] = "Oooops, da ging was schief"
      render :action => "edit"
    end
  end
end
