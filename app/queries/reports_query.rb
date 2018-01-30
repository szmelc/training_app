class ReportsQuery
  attr_reader :relation

  def initialize(relation = DailyPostsCount.all)
    @relation = relation
  end

  def monthly
    relation.where(date: this_month).sum(:count)
  end

  private

  def this_month
    Date.today.beginning_of_month..Date.today.end_of_month
  end
end
