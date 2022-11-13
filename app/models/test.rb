class Test < ApplicationRecord
  has_many :questions
  has_many :users_tests
  has_many :users, through: :user_tests
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  def self.sorted_descending_with_category(title_category)
    joins('JOIN categories ON tests.category_id = categories.id')
    .where(categories: { title: title_category })
    .order(title: :DESC)
    .pluck(:title)
  end
end
