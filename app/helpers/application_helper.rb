module ApplicationHelper
  def is_admin_page?
    request.url.to_s.include? '/admin'
  end
end