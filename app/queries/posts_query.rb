class PostsQuery
  attr_reader :relation

  def initialize(relation = Post.all)
    @relation = relation
  end

  def posted_today
    relation.where(created_at: today)
  end

  def posted_this_month
    relation.where(created_at: this_month)
  end

  def with_user
    relation.includes(:user).order('created_at DESC')
  end

  private

  def today
    Date.today.beginning_of_day..Date.today.end_of_day
  end

  def this_month
    Date.today.beginning_of_month..Date.today.end_of_month
  end
end
