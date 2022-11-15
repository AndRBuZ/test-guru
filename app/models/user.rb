class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests, dependent: :destroy
  has_many :test_author, class_name: 'Test', foreign_key: :author_id

  validates :name, presence: true
  validates :email, presence: true

  def complied_tests_on_level(level)
    tests.where(level: level)
  end
end
