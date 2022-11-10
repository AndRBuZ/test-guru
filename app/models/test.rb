class Test < ApplicationRecord
  def self.sorted_descending_with_category(category)
    Test.joins('JOIN categories ON tests.category_id = categories.id').where(categories: { title: category })
    .order('categories.title DESC').pluck('tests.title')
  end
end
