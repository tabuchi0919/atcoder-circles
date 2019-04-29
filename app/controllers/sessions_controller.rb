class SessionsController < ApplicationController
  def create
    circle = Circle.find_by(circle_name: params[:circle_name])
    if circle&.authenticate(params[:password])
      session[:circle_id] = circle.id
      flash[:success] = 'ログインしました'
    else
      flash[:danger] = 'ログインに失敗しました'
    end
    redirect_back(fallback_location: circles_path)
  end

  def destroy
    reset_session
    flash[:notice] = 'ログアウトしました'
    redirect_back(fallback_location: circles_path)
  end
end
