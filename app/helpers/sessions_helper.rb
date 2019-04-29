module SessionsHelper
  def current_circle
    Circle.find_by(id: session[:circle_id])
  end

  def signed_in?
    session[:circle_id].present?
  end
end
