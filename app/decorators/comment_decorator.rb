class CommentDecorator < ApplicationDecorator
  delegate_all

  def author
    object.user.name
  end

  def commented_at
    'commented ' + h.time_ago_in_words(object.created_at) + ' ago'
  end

  def user_avatar
    if object.user.avatar?
      h.image_tag object.user.avatar.medium.url
    else
      h.image_tag 'default_avatar'
    end
  end

end
