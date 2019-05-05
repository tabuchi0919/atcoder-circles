class ContestsController < ApplicationController
  def show
    @circle = Circle.find_by(circle_name: params[:circle_name])
    unless accesible?(@circle)
      flash[:error] = 'ページにアクセスできませんでした'
      return redirect_to :circles
    end
    @users = @circle.users
    @contest = Contest.find(params[:id])
    @tasks = @contest.tasks
    @standings = @contest.standings.includes(:user)
  end
end
