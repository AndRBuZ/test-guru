class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests, dependent: :destroy
  has_many :test_author, class_name: 'Test', foreign_key: :author_id

  def complied_tests_on_level(level)
    tests.where(level: level)
  end
end
