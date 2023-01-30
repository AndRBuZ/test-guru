class GiveBadgeService
  def initialize(test_passage)
    @current_test = test_passage.test
    @current_user = test_passage.user
  end

  def call
    @current_user.badges << Badge.select { |badge| badge.rule == 'first' } if passed_first_try? == true
    @current_user.badges << Badge.select { |badge| badge.rule == 'level' } if completed_entire_level? == true
    @current_user.badges << Badge.select { |badge| badge.rule == 'category' } if whole_category_passed? == true
  end

  def passed_first_try?
    current_test_passaging = @current_user.test_passages.select do |test_passage|
      test_passage.user_id == @current_user.id && test_passage.test_id == @current_test.id
    end
    current_test_succeeded = current_test_passaging.select(&:succeeded?)
    current_test_passaging.count == 1 && current_test_succeeded.count == 1
  end

  def completed_entire_level?
    all_tests_on_level = Test.select { |test_level| test_level.level == @current_test.level }.pluck(:id)
    tests_succeeded = @current_user.test_passages.select(&:succeeded?).pluck(:test_id)
    (all_tests_on_level - tests_succeeded.uniq).empty?
  end

  def whole_category_passed?
    all_tests_in_category = Test.select { |category| category.category_id == @current_test.category_id }.pluck(:id)
    tests_succeeded = @current_user.test_passages.select(&:succeeded?).pluck(:test_id)
    (all_tests_in_category - tests_succeeded.uniq).empty?
  end
end
