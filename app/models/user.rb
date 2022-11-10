class User < ApplicationRecord
  def complied_tests_on_level(level)
    UserTest.includes(:test).where(user: self, test: { level: level })
  end
end
