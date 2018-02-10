module ApplicationHelper
  def refresh_page
    redirect_to request.referrer
  end
end
