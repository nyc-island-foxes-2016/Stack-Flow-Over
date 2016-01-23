module ApplicationHelper
  def std_date_format(date)
    return date.strftime('%b %e, %Y %l:%M %p') if date
  end
end
