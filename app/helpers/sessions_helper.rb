module SessionsHelper
  def current_circle
    Circle.find_by(id: session[:circle_id])
  end

  def signed_in?
    return false unless session[:circle_id]

    if session[:circle_id] && !Circle.find_by(id: session[:circle_id])
      session.delete(:circle_id)
    end
    session[:circle_id].present?
  end

  def accesible?(circle)
    circle && (!circle.private || session[:circle_id] == circle.id)
  end
end
