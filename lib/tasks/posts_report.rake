namespace :report do
  task posts_daily: :environment do
    desc 'counts how many posts have been posted today'
    number_of_posts = PostsQuery.new.posted_today.count
    DailyPostsCount.create(
      count: number_of_posts,
      date: Date.today
    )
  end

  task posts_monthly: :environment do
    desc 'counts how many posts have published monthly'
    number_of_posts = PostsQuery.new.posted_this_month.count
    MonthlyPostsCount.create(
      count: number_of_posts,
      month: Date.today.strftime("%B"),
      date: Date.today
    )
  end
end
