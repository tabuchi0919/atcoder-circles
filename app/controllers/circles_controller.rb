class CirclesController < ApplicationController
  def index
    @circles = Circle.where(university: true)
  end

  def new
    @circle = Circle.new
  end

  def create
    @circle = Circle.new(
      circle_name: params[:circle][:circle_name],
      password: params[:circle][:password],
      private: ActiveRecord::Type::Boolean.new.cast(params[:circle][:private])
    )
    if @circle.save
      session[:circle_id] = @circle.id
      flash[:success] = '登録しました'
      redirect_to @circle
    else
      flash.now[:error] = '登録に失敗しました'
      render :new
    end
  end

  def update
    @circle = Circle.find_by(circle_name: params[:circle_name])
    @circle.update_attributes(
      circle_name: params[:circle][:circle_name],
      password: params[:circle][:password],
      private: ActiveRecord::Type::Boolean.new.cast(params[:circle][:private])
    )
    if @circle.save
      flash[:success] = '変更しました'
    else
      flash[:error] = '変更に失敗しました'  
    end
    redirect_to @circle
  end

  def destroy
    @circle = Circle.find_by(circle_name: params[:circle_name])
    if @circle.delete
      flash.now[:success] = '削除しました'
      session.delete(:circle_id)
      render :new
    else
      flash[:error] = '削除に失敗しました'  
      redirect_to @circle
    end
  end

  def show
    @circle = Circle.find_by(circle_name: params[:circle_name])
    if @circle.nil? || (@circle.private && session[:circle_id] != @circle.id)
      flash[:error] = 'ページにアクセスできませんでした'
      return redirect_to :circles
    end
    @users = @circle.users
    @virtual_contests = @circle.virtual_contests
    @edible = (current_circle == @circle)
    generate_chart
  end

  def api
    circle = Circle.find_by(circle_name: params[:circle_circle_name])
    if circle&.private
      render status: 403, json: { status: 403, message: 'Forbidden' }
    elsif circle
      render status: 200, :json => circle.users.map(&:user_name)
    else
      render status: 400, json: { status: 400, message: 'Bad Request' }
    end
  end

  private

  def generate_chart
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: 'レート分布')
      f.chart(defaultSeriesType: 'pie')
      f.series(
        type: 'pie',
        name: 'Users',
        data: [
          { name: 'Gray', y: @users.where(rating: 0...400).count, color: '#808080' },
          { name: 'Brown', y: @users.where(rating: 400...800).count, color: '#804000' },
          { name: 'Green', y: @users.where(rating: 800...1200).count, color: '#008000' },
          { name: 'Cyan', y: @users.where(rating: 1200...1600).count, color: '#00C0C0' },
          { name: 'Blue', y: @users.where(rating: 1600...2000).count, color: '#0000FF' },
          { name: 'Yellow', y: @users.where(rating: 2000...2400).count, color: '#C0C000' },
          { name: 'Orange', y: @users.where(rating: 2400...2800).count, color: '#FF8800' },
          { name: 'Red', y: @users.where(rating: 2800...5000).count, color: '#FF0000' }
        ],
        dataLabels: { enabled: false }
      )
    end
  end
end
