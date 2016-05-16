module ApplicationHelper
  def article_cover url, options ={}
    html_class = options[:class]
    html_style = "background:url(#{url});height: 200px;top: 0px; left: 0px;width: 100%;"

    html = "<header class='#{html_class}' style='#{html_style}'></header>"
    html.html_safe
  end
end
