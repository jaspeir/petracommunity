class SpecController < ApplicationController
  
  def new
    @spec = Spec.new
    render :action => "edit"
  end
  
  def edit
    @spec = current_account.spec || current_account.build_spec
  end
  
  def update
    @spec = current_account.spec || current_account.build_spec
    if @spec.update_attributes(params[:spec])
      redirect_to :controller => "profiles", :action => 'show'
    else
      render :action => 'edit'
    end
  end
  
  # TODO: view anhand
end
