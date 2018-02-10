namespace :generate do
  task posts_daily: :environment do
    desc 'generates daily reports for past posts from 7 days'
    n = 7
    n.times do
      count = Post.where(created_at: DateTime.now.change(offset: "+0000").beginning_of_day - n).count
      DailyPostsCount.create(
        count: count,
        date: Date.today - n
      )
      n -= 1
    end
  end
end
