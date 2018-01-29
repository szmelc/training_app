namespace :report do
  task posts_daily: :environment do
    desc 'counts how many posts have been posted today'
    puts PostsQuery.new.posted_today.count
  end
end
