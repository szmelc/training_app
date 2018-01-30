class PostsQuery
  attr_reader :relation

  def initialize(relation = Post.all)
    @relation = relation
  end

  def posted_today
    relation.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day)
  end

  def with_user
    relation.includes(:user).order('created_at DESC')
  end
end
