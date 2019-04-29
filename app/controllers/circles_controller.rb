class CirclesController < ApplicationController
  def index
    @circles = Circle.all
  end

  def show
    @circle = Circle.find_by(circle_name: params[:circle_name])
    @virtual_contests = @circle.virtual_contests
    @edible = (current_circle == @circle)
  end
end
