class SessionsController < ApplicationController
  def create
    circle = Circle.find_by(circle_name: params[:circle_name])
    if circle&.authenticate(params[:password])
      session[:circle_id] = circle.id
      flash[:success] = 'ログインしました'
      redirect_to circle
    else
      flash[:danger] = 'ログインに失敗しました'
      redirect_back(fallback_location: circles_path)
    end
  end

  def destroy
    circle = Circle.find(session[:circle_id])
    reset_session
    flash[:notice] = 'ログアウトしました'
    if circle.private
      redirect_to circles_path
    else
      redirect_to circle
    end
  end
end
