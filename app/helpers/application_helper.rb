module ApplicationHelper
  def stylesheets(*scss)
    content_for (:head) { stylesheet_link_tag(*scss) }
  end

  def javascripts(*js)
    content_for (:head) { javascript_include_tag(*js) }
  end
end

def error_messages(object, field_name, _errors_class = "")
  return if object.blank? || object.nil?

  str = "<p class='text-danger'>#{object.errors[field_name.to_s]&.first}</p>"
  str.html_safe
end
