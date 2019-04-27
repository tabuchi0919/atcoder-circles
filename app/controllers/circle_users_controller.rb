class CircleUsersController < ApplicationController
  def create
    circle_user = CircleUser.new(
      circle_name: params[:circle_user][:circle_name],
      user_name: params[:circle_user][:user_name]
    )
    if circle_user.save
      flash[:success] = '追加しました'
    else
      flash[:error] = '追加に失敗しました'
    end
    redirect_back(fallback_location: Circle)
  end

  def destroy
    circle_user = CircleUser.find_by(
      circle_name: params[:circle_name],
      user_name: params[:user_name]
    )
    if circle_user.delete
      flash[:success] = '削除しました'
    else
      flash[:error] = '削除に失敗しました'
    end
    redirect_back(fallback_location: Circle)
  end
end
