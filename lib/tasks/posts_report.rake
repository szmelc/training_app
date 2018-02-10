namespace :report do
  task posts_daily: :environment do
    desc 'counts how many posts have been posted the previous day'
    number_of_posts = PostsQuery.new.posted_yesterday.count
    DailyPostsCount.create(
      count: number_of_posts,
      date: Date.yesterday
    )
  end

  task posts_monthly: :environment do
    desc 'counts how many posts have published monthly'
    number_of_posts = DailyPostsCount.where(date: last_month).sum(:count)
    MonthlyPostsCount.create(
      count: number_of_posts,
      month: Date.yesterday.strftime("%B"),
      date: Date.yesterday
    )
  end
end

private

def last_month
  Date.yesterday.beginning_of_month..Date.yesterday.end_of_month
end
