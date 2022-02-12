module ApplicationHelper
  def my_imdb_style_rating_for(rateable_obj, dimension=nil)
    cached_average = rateable_obj.average dimension
    avg = cached_average ? cached_average.avg : 0
    content_tag :div, '', :style => "background-image:url(/assets/big-star.png);width:81px;height:81px;margin-top:10px;" do
      content_tag :p, avg, :style => "position:relative;line-height:85px;text-align:center;"
    end
  end
end
