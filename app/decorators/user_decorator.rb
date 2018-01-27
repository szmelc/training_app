class UserDecorator < Draper::Decorator
  delegate_all

  def title
    object.title
  end

  def joined
    object.created_at.strftime("%Y-%m-%d")
  end

end
