module ApplicationHelper
  def active?(page)
    'active' if request.env['PATH_INFO'] == page
  end

  def get_client_ip
    request.remote_ip
  end
end
