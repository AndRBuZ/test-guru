# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([{ name: 'Jack' }, { name: 'Nick' }, { name: 'John'}])

categories = Category.create!([{ title: 'Programming languages' }, { title: 'Databases'}])

tests = Test.create!(
  [
    { title: 'Ruby', level: 0, category_id: categories[0].id, author_id: users[0].id },
    { title: 'Ruby', level: 1, category_id: categories[0].id, author_id: users[0].id },
    { title: 'MySQL', level: 2, category_id: categories[1].id, author_id: users[1].id },
    { title: 'PostgreSQL', level: 0, category_id: categories[1].id, author_id: users[1].id }
  ]
)

questions = Question.create!(
  [
    { text: 'Who is the creator?', test_id: tests[0].id },
    { text: 'What are the ruby libraries called?', test_id: tests[1].id },
    { text: 'List connection type?', test_id: tests[2].id },
    { text: 'Who is the developer?', test_id: tests[3].id }
  ]
)

answers = Answer.create!(
  [
    { text: 'Yukihiro Matsumoto', question_id: questions[0].id },
    { text: 'Gems', question_id: questions[1].id },
    { text: 'Inner, Left, Right, Full', question_id: questions[2].id },
    { text: 'PostgreSQL Global Development Group', question_id: questions[3].id }
  ]
)
