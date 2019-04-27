class CirclesController < ApplicationController
  def index
    @circles = Circle.all
  end

  def show
    @circle = Circle.find(params[:id])
  end
end
