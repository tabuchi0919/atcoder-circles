class CirclesController < ApplicationController
  
  def index
    @circles = Circle.all
    @users = User.all
    generate_chart
  end

  def show
    @circle = Circle.find_by(circle_name: params[:circle_name])
    @users = @circle.users
    @virtual_contests = @circle.virtual_contests
    @contests = Contest.all
    @edible = (current_circle == @circle)
    generate_chart
  end

  private

  def generate_chart
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: 'レート分布')
      f.chart(defaultSeriesType:"pie")
      f.series(
        type: "pie",
        name: 'Users',
        data: [
          { name: "Gray", y: @users.where(rating: 0...400).count, color: "#808080" },
          { name: "Brown", y: @users.where(rating: 400...800).count, color: "#804000" },
          { name: "Green", y: @users.where(rating: 800...1200).count, color: "#008000" },
          { name: "Cyan", y: @users.where(rating: 1200...1600).count, color: "#00C0C0" },
          { name: "Blue", y: @users.where(rating: 1600...2000).count, color: "#0000FF" },
          { name: "Yellow", y: @users.where(rating: 2000...2400).count, color: "#C0C000" },
          { name: "Orange", y: @users.where(rating: 2400...2800).count, color: "#FF8800" },
          { name: "Red", y: @users.where(rating: 2800...5000).count, color: "#FF0000" },
        ],
        dataLabels: { enabled: false }
      )
    end
  end
end
