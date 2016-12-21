class ActorsController < ApplicationController

  def index
    @actors = Actor.all
  end

  def show
    @actor = Actor.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @actor}
    end
  end

end
