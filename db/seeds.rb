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
    { text: 'Framework name for Ruby?', test_id: tests[1].id },
    { text: 'List connection type?', test_id: tests[2].id },
    { text: 'Maximum table size?', test_id: tests[3].id }
  ]
)

answers = Answer.create!(
  [
    { text: 'Yukihiro Matsumoto', correct: true, question_id: questions[0].id },
    { text: 'Guido van Rossum', question_id: questions[0].id },
    { text: 'Bjarne Stroustrup', question_id: questions[0].id },
    { text: 'Django', question_id: questions[1].id },
    { text: 'Gems', correct: true, question_id: questions[1].id },
    { text: 'React', question_id: questions[1].id },
    { text: 'Inner, Left, Right, Full', correct: true, question_id: questions[2].id },
    { text: 'Inner, Full', question_id: questions[2].id },
    { text: 'Left, Right', question_id: questions[2].id},
    { text: '32TB', correct: true, question_id: questions[3].id },
    { text: '16TB', correct: true, question_id: questions[3].id },
    { text: '24TB', correct: true, question_id: questions[3].id }
  ]
)

user_tests = UserTest.create!(
  [
    { user_id: users[2].id, test_id: tests[1].id },
    { user_id: users[2].id, test_id: tests[2].id }
  ]
)
