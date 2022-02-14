module ApplicationHelper
  def my_imdb_style_rating_for(rateable_obj, dimension=nil)
    cached_average = rateable_obj.average dimension
    avg = cached_average ? cached_average.avg : 0
    url = asset_pack_path("media/images/big-star.png")
    content_tag :div, '', :style => "background-image:url(#{url});width:81px;height:81px;margin-top:10px;" do
      content_tag :p, avg, :style => "position:relative;line-height:85px;text-align:center;"
    end
  end
  def rating_for_webpacker(rateable_obj, dimension=nil, options={})
    options[:star_path] ||= ""
    # byebug
    options[:star_on] ||= asset_pack_path("media/images/star-on.png")
    options[:star_off]  ||= asset_pack_path("media/images/star-off.png")
    options[:star_half] ||= asset_pack_path("media/images/star-half.png")
    options[:cancel_on] ||= asset_pack_path("media/images/cancel-on.png")
    options[:cancel_off] ||= asset_pack_path("media/images/cancel-off.png")

    rating_for(rateable_obj, dimension, options)
  end
end
