class UserDecorator < Draper::Decorator
  delegate_all

  def title
    object.title
  end

  def joined
    object.created_at.strftime('%Y-%m-%d')
  end

  def formatted_website
    object.website.gsub('http://', '')
  end

  def avatar
    h.image_tag object.avatar.medium.url, title: 'Avatar', class: 'user-avatar' if object.avatar?
  end
end
