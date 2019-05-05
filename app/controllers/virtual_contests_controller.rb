class VirtualContestsController < ApplicationController
  def create
    virtual_contest = VirtualContest.new(
      circle_id: params[:virtual_contest][:circle_id],
      title: params[:virtual_contest][:title],
      url: params[:virtual_contest][:url]
    )

    if virtual_contest.save
      flash[:success] = '追加しました'
    else
      flash[:error] = '追加に失敗しました'
    end
    redirect_back(fallback_location: circles_path)
  end

  def destroy
    virtual_contest = VirtualContest.find(params[:virtual_contest_id])

    if virtual_contest.delete
      flash[:success] = '削除しました'
    else
      flash[:error] = '削除に失敗しました'
    end
    redirect_back(fallback_location: circles_path)
  end
end
