class ContestsController < ApplicationController
  def show
    @circle = Circle.includes(:users).find_by(circle_name: params[:circle_name])
    @contest = Contest.find(params[:id])
    @tasks = @contest.tasks
    @standings = @contest.standings.includes(:user, :submissions)
  end
end
