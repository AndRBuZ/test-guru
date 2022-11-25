class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions, dependent: :destroy
  has_many :test_passages
  has_many :users, through: :test_passages, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true }

  scope :easy_level, -> { where(level: 0..1) }
  scope :medium_level, -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY) }
  scope :with_category_desc, lambda { |title_category|
                                     joins(:category).where(category: { title: title_category }).order(title: :DESC)
                                   }

  def self.with_category_desc_in_array(title_category)
    with_category_desc(title_category).pluck(:title)
  end
end
