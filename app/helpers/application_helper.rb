module ApplicationHelper
  def stylesheets(*sass)
    content_for (:head) { stylesheet_link_tag(*sass) }
  end

  def javascripts(*js)
    content_for (:head) { javascript_include_tag(*js) }
  end
end
