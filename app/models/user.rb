class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :test_passages
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :test_author, class_name: 'Test', foreign_key: :author_id

  EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_FORMAT }

  def complied_tests_on_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
