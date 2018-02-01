class CommentDecorator < ApplicationDecorator
  delegate_all

  def author
    object.user.name
  end

  def commented_at
    'commented ' + h.time_ago_in_words(object.created_at) + ' ago'
  end

  def user_avatar
    # h.image_tag object.avatar.medium.url, title: 'Avatar', class: 'user-avatar' if object.avatar?
    h.image_tag object.user.avatar.medium.url if object.user.avatar?
  end

end
