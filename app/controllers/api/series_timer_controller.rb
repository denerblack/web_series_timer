class Api::SeriesTimerController < ApplicationController
  def find_serie
    serie = Serie.new
    serie.find_episodes(params[:name])
    respond_to do |format|
      format.json { render :json => serie.to_api}
    end
  end
  
  def force_find_serie
    serie = Serie.new
    serie.find_episodes(params[:name], :force)
    respond_to do |format|
      format.json { render :json => serie.to_api}
    end
  end
end
