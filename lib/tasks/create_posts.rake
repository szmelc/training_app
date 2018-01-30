namespace :generate do
  task posts: :environment do
    desc 'Creates random posts for users'
    n = 1
    5.times do
      Post.create(
        user_id: 1,
        title: Faker::Team.name + ' sucks',
        content: Cicero.paragraphs(4),
        created_at: Date.today - 3
        )
      n += 1
    end
    4.times do
      Post.create(
        user_id: 1,
        title: Faker::RockBand.name,
        content: Cicero.paragraphs(3),
        created_at: Date.today - 2
        )
      n += 1
    end
    3.times do
      Post.create(
        user_id: 1,
        title: Faker::Team.name,
        content: Cicero.paragraphs(5),
        created_at: Date.today - 1
        )
      n += 1
    end
  end
end
