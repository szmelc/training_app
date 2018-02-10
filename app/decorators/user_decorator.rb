class UserDecorator < Draper::Decorator
  delegate_all

  def title
    object.title || NullUser.title
  end

  def joined
    object.created_at.strftime('%Y-%m-%d')
  end

  def formatted_website
    object.website.gsub('http://', '')
  end

  def avatar
    if object.avatar?
      h.image_tag object.avatar.medium.url, title: 'Avatar', class: 'user-avatar' || NullUser.avatar
    else
      h.image_tag 'default_avatar'
    end
  end

  def user_bio
    object.bio || NullUser.bio
  end
end
