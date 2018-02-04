namespace :generate do
  COMMENT_CONTENT = "Fajny serial, ale powinien mieć przynajmniej 45 minut.
  Ale to tylko moje zdanie. Każdy uważa inaczej. Osobiście apelują do wszystkich
  hejterów o niekomentowanie. Poczekajmy do końca sezonu! A tak w ogóle,
  krzyczycie o niespójności historycznej, ale czy ktoś z Was widział kiedykolwiek
  smoka? W waszej ukochanej “Grze o Tron“ są smoki, a one nie istniały."

  PASSWORD = 'password'

  task users: :environment do
    desc 'creates users'
    User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: PASSWORD,
    )
  end

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

  task comments: :environment do
    desc 'creates comments for posts'
    Comment.create(content: COMMENT_CONTENT, post_id: 1, user_id: 1)
    Comment.create(content: COMMENT_CONTENT, post_id: 1, user_id: 2)
    Comment.create(content: COMMENT_CONTENT, post_id: 1, user_id: 4)
    Comment.create(content: COMMENT_CONTENT, post_id: 1, user_id: 3)
    Comment.create(content: COMMENT_CONTENT, post_id: 1, user_id: 1)
  end
end
