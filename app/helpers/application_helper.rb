module ApplicationHelper
  def user_by_params(params)
    User.find(params[:user_id]).email
  end
end
