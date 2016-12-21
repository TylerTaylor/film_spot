class DirectorsController < ApplicationController

  def index
    @directors = Director.all
  end

  def show
    @director = Director.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @director }
    end
  end

end