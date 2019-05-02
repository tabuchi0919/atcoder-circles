module UsersHelper
  def color(user)
    color_array[[user.rating / 400, 7].min]
  end

  private

  def color_array
    %w[gray brown green cyan blue yellow orange red]
  end
end
