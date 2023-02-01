class WholeCategoryPassedService
  def initialize(test_passage)
    @current_test = test_passage.test
    @current_user = test_passage.user
  end

  def call
    @current_user.badges << Badge.select { |badge| badge.rule == 'category' } if whole_category_passed?
  end

  private

  def whole_category_passed?
    all_tests_in_category = Test.select { |category| category.category_id == @current_test.category_id }.pluck(:id)
    tests_succeeded = @current_user.test_passages.select(&:succeeded?).pluck(:test_id)
    (all_tests_in_category - tests_succeeded.uniq).empty?
  end
end
