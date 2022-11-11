class User < ApplicationRecord
  def complied_tests_on_level(level)
    Test.('JOIN user_tests ON tests.id = user_tests.test_id')
        .where(user_tests: { user_id: id }, level: level)
  end
end
