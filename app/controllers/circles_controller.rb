class CirclesController < ApplicationController
  def index
    @circles = Circle.all
  end

  def show
    @circle = Circle.find(params[:id])
    @virtual_contests = @circle.virtual_contests
  end
end
