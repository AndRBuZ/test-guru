class Test < ApplicationRecord
  def self.sorted_descending_with_category(title_category)
    joins('JOIN categories ON tests.category_id = categories.id')
    .where(categories: { title: title_category })
    .order(title: :DESC)
    .pluck(:title)
  end
end
