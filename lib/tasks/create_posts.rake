namespace :generate do
  task posts: :environment do
    desc 'Creates random posts for users'
    n = 1
    5.times do
      Post.create(
        user_id: 1,
        title: "Post 3 days ago #{n}",
        content: (0...100).map { ('a'..'z').to_a[rand(26)] }.join,
        created_at: Date.today - 3
        )
      n += 1
    end
    4.times do
      Post.create(
        user_id: 1,
        title: "Post 2 days ago #{n}",
        content: (0...100).map { ('a'..'z').to_a[rand(26)] }.join,
        created_at: Date.today - 2
        )
      n += 1
    end
    3.times do
      Post.create(
        user_id: 1,
        title: "Post 1 day ago #{n}",
        content: (0...100).map { ('a'..'z').to_a[rand(26)] }.join,
        created_at: Date.today - 1
        )
      n += 1
    end
  end
end
