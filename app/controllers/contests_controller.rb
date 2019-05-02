class ContestsController < ApplicationController
  def show
    @circle = Circle.find_by(circle_name: params[:circle_name])
    @users = @circle.users
    @contest = Contest.find(params[:id])
    @tasks = @contest.tasks
    @standings = @contest.standings.includes(:user)
  end
end
