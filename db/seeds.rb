# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!(
  [
    { name: 'Jack', email: 'Jack@example.com' },
    { name: 'Nick', email: 'Nick@example.com' }, 
    { name: 'John', email: 'Jhon@example.com' }
  ]
)

categories = Category.create!([{ title: 'Programming languages' }, { title: 'Databases'}])

tests = Test.create!(
  [
    { title: 'Ruby', level: 0, category: categories[0], author: users[0] },
    { title: 'Ruby', level: 1, category: categories[0], author: users[0] },
    { title: 'MySQL', level: 2, category: categories[1], author: users[1] },
    { title: 'PostgreSQL', level: 0, category: categories[1], author: users[1] }
  ]
)

questions = Question.create!(
  [
    { text: 'Who is the creator?', test: tests[0] },
    { text: 'Framework name for Ruby?', test: tests[1] },
    { text: 'List connection type?', test: tests[2] },
    { text: 'Maximum table size?', test: tests[3] }
  ]
)

answers = Answer.create!(
  [
    { text: 'Yukihiro Matsumoto', correct: true, question: questions[0] },
    { text: 'Guido van Rossum', question: questions[0] },
    { text: 'Bjarne Stroustrup', question: questions[0] },
    { text: 'Django', question: questions[1] },
    { text: 'Gems', correct: true, question: questions[1] },
    { text: 'React', question: questions[1] },
    { text: 'Inner, Left, Right, Full', correct: true, question: questions[2] },
    { text: 'Inner, Full', question: questions[2] },
    { text: 'Left, Right', question: questions[2] },
    { text: '32TB', correct: true, question: questions[3] },
    { text: '16TB', correct: true, question: questions[3] },
    { text: '24TB', correct: true, question: questions[3] }
  ]
)

user_tests = UserTest.create!(
  [
    { user: users[2], test: tests[1] },
    { user: users[2], test: tests[2] }
  ]
)
