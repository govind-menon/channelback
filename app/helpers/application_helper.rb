module ApplicationHelper
  def is_admin_page?
    if (request.url.to_s.include? '/admin' or request.url.to_s.include? '/category')
      true
    else
      false
    end
  end
end