class CircleUsersController < ApplicationController
  def create
    user = User.find_or_create_by(user_name: params[:circle_user][:user_name])

    circle_user = CircleUser.new(
      circle_id: params[:circle_user][:circle_id],
      user_id: user.id
    )

    if circle_user.save
      flash[:success] = '追加しました'
    else
      flash[:error] = '追加に失敗しました'
    end
    redirect_back(fallback_location: circles_path)
  end

  def destroy
    circle_user = CircleUser.find_by(
      circle_id: params[:id],
      user_id: params[:user_id]
    )

    if circle_user.delete
      flash[:success] = '削除しました'
    else
      flash[:error] = '削除に失敗しました'
    end
    redirect_back(fallback_location: circles_path)
  end
end
