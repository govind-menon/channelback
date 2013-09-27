module ApplicationHelper
  def is_admin_page?
    (request.url.to_s.include? '/admin' or request.url.to_s.include? '/categories')
    end
  end