class PostsQuery
  attr_reader :relation

  def initialize(relation = Post.all)
    @relation = relation
  end

  def posted_yesterday
    relation.where(created_at: yesterday)
  end

  def posted_last_month
    return unless Date.today.strftime("%d") != "01"
    relation.where(created_at: last_month)
  end

  def with_user
    relation.includes(:user).order('created_at DESC')
  end

  private

  def yesterday
    Date.yesterday.beginning_of_day..Date.yesterday.end_of_day
  end

  def last_month
    Date.yesterday.beginning_of_month..Date.yesterday.end_of_month
  end
end
