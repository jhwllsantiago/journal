module TasksHelper
  def deadline_to_words date_in_string
    date = new_time date_in_string
    date.strftime("%d %^b %Y")
  end

  def deadline_now? date_in_string
    date = new_time date_in_string
    date < Time.now
  end

  private
  def new_time date_in_string
    date_array = date_in_string.split(/-/)
    y = date_array[0].to_i
    m = date_array[1].to_i
    d = date_array[2].to_i
    Time.new(y, m ,d)
  end
end
