module ApplicationHelper

  def simple_time(time)
    time.strftime("%Y-%m-%d  %H:%M  ")
  end
  def publication_date(time)
    time.strftime("%Y年%m月%d日")
  end
end
