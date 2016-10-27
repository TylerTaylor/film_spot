module DirectorsHelper
  def current_director
    @director = Director.find(params[:director_id])
  end
end
