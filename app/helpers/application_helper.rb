module ApplicationHelper
	# Return a title on a per-page basis.
  def title
    base_title = "Ben's Sample App"
    @title.nil? ? base_title : "#{base_title} | #{@title}"
  end

  def wrap(content)
    sanitize(raw(content.split.map{ |s| wrap_long_string(s) }.join(' ')))
  end

  private

    def wrap_long_string(text, max_width = 36)
      zero_width_space = "&#8203;"
      regex = /.{1,#{max_width}}/
      (text.length < max_width) ? text : 
                                  text.scan(regex).join(zero_width_space)
    end
end
