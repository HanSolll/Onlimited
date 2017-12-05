module ItemHelper
  def render_with_hashtags(content)
    content.gsub(/#\w+/){|word| link_to word, "/item/hashtag/#{word.downcase.delete('#')}"}.html_safe
  end
end
