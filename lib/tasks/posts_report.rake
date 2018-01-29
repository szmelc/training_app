namespace :report do
  task posts_daily: :environment do
    desc 'counts how many posts have been posted today'
    number_of_posts = PostsQuery.new.posted_today.count
    DailyPostsCount.create(
      count: number_of_posts,
      date: Date.today
    )
  end
end
