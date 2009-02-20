class SearchController < ApplicationController
  def index
  end
  
  def do
    @query = params[:search][:string]
    @results = Account.find_by_contents('*' + @query + '*')
  end
end
