class PostDecorator < Draper::Decorator
  delegate_all

  def written_at
    h.time_ago_in_words(object.created_at) + ' ago'
  end

  def author
    author = User.find(object.user_id)
    author.name
  end

end
