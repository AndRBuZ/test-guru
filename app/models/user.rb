class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests

  def complied_tests_on_level(level)
    Test.('JOIN user_tests ON tests.id = user_tests.test_id')
        .where(user_tests: { user_id: id }, level: level)
  end
end
