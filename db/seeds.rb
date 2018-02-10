# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

POST_CONTENT = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Nunc sit amet ullamcorper neque. Sed quis orci tortor. Nam libero lorem,
  iaculis sit amet dapibus nec, vulputate quis nisl. Quisque venenatis finibus
  est. Nullam ante nisl, tincidunt id consequat eget, condimentum nec nunc.
  Etiam euismod sapien sed libero hendrerit commodo sit amet sed velit.
  Praesent at fermentum leo. Praesent diam sapien, tristique ut tincidunt nec,
  finibus ut sapien. Praesent tortor odio, venenatis vel leo eget, varius fringilla
  magna. Praesent pulvinar at leo a fringilla. Vivamus efficitur lorem feugiat
  mi egestas condimentum eget ut mi. Nam mi lectus, condimentum sed facilisis
  et, lobortis a ex. Proin et elit sagittis, lobortis nunc quis, egestas justo.

  Phasellus molestie efficitur fermentum. Nunc sagittis facilisis molestie.
  Pellentesque ut vehicula velit. Interdum et malesuada fames ac ante ipsum
  primis in faucibus. Morbi tristique lacus in quam dignissim, sit amet
  ultricies nibh pretium. Nulla dignissim ipsum lacus, id convallis metus
  egestas quis. Mauris laoreet vehicula feugiat. Nullam lectus nunc, ultrices
  tristique vehicula vitae, aliquam ac purus. Cras in facilisis tortor.
  Pellentesque blandit egestas justo, in commodo massa efficitur in. Donec
  condimentum ut nibh ut laoreet. Pellentesque aliquam enim purus, vulputate
  commodo arcu consectetur non."

COMMENT_CONTENT = "Fajny serial, ale powinien mieć przynajmniej 45 minut.
  Ale to tylko moje zdanie. Każdy uważa inaczej. Osobiście apelują do wszystkich
  hejterów o niekomentowanie. Poczekajmy do końca sezonu! A tak w ogóle,
  krzyczycie o niespójności historycznej, ale czy ktoś z Was widział kiedykolwiek
  smoka? W waszej ukochanej “Grze o Tron“ są smoki, a one nie istniały."

AVATARS = [
  'av01.jpg',
  'av02.jpg',
  'av03.jpg',
  'av04.jpg',
  'av05.jpg',
  'av06.jpg',
  'av07.jpg'
]

8.times do
  user = User.new(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          password: 'TestPass',
          title: 'Junior Ruby on Rails Developer',
          country: 'Poland',
          bio: Faker::ChuckNorris.fact,
          avatar: Rails.root.join("app/assets/images/#{AVATARS.sample}").open
        )
  user.skip_confirmation!
  user.save
  print '.'
end

42.times do
  Post.create(
      content: POST_CONTENT,
      title: Faker::RockBand.name,
      user_id: 1,
      created_at: Date.new(2018, 1, 23))
    print '.'
end

3.times do
  Post.create(
    content: POST_CONTENT,
    title: Faker::RockBand.name,
    user_id: 1,
    created_at: Date.today - 7)
  print '.'
end

2.times do
  Post.create(content: POST_CONTENT,
    title: Faker::RockBand.name,
    user_id: 2,
    created_at: Date.today - 6)
  print '.'
end

4.times do
  Post.create(content: POST_CONTENT,
    title: Faker::RockBand.name,
    user_id: 3,
    created_at: Date.today - 5)
  print '.'
end

3.times do
  Post.create(content: POST_CONTENT,
    title: Faker::RockBand.name,
    user_id: 4,
    created_at: Date.today - 4)
  print '.'
end

4.times do
  Post.create(content: POST_CONTENT,
    title: Faker::RockBand.name,
    user_id: 5,
    created_at: Date.today - 3)
  print '.'
end

3.times do
  Post.create(content: POST_CONTENT,
    title: Faker::RockBand.name,
    user_id: 6,
    created_at: Date.today - 2)
  print '.'
end

3.times do
  Post.create(content: POST_CONTENT,
    title: Faker::RockBand.name,
    user_id: 7,
    created_at: Date.today - 1)
  print '.'
end

4.times do
  Post.create(content: POST_CONTENT,
    title: Faker::RockBand.name,
    user_id: 7,
    created_at: Date.today)
  print '.'
end

90.times do
  num = Random.new
  Comment.create(content: COMMENT_CONTENT, user_id: num.rand(7), post_id: num.rand(22))
  print '.'
end

DailyPostsCount.create(count: 42, date: Date.new(2018, 1, 23))
MonthlyPostsCount.create(count: 42, month: "January", date: Date.new(2018, 1, 31))


