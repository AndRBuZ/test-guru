class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions, dependent: :destroy
  has_many :users_tests
  has_many :users, through: :user_tests, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true }

  scope :easy_level, -> { where(level: 0..1) }
  scope :medium_level, -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY) }
  scope :sorted_descending_with_category, lambda { |title_category|
                                            joins(:category)
                                              .where(category: { title: title_category })
                                              .order(title: :DESC).pluck(:title)
                                          }
end
