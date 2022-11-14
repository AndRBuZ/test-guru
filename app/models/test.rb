class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions, dependent: :destroy
  has_many :users_tests
  has_many :users, through: :user_tests, dependent: :destroy

  def self.sorted_descending_with_category(title_category)
    joins(:category)
      .where(category: { title: title_category })
      .order(title: :DESC)
      .pluck(:title)
  end
end
