class CompletedEntireLevelService
  def initialize(test_passage)
    @current_test = test_passage.test
    @current_user = test_passage.user
  end

  def call
    @current_user.badges << Badge.select { |badge| badge.rule == 'level' } if completed_entire_level?
  end

  private

  def completed_entire_level?
    all_tests_on_level = Test.select { |test_level| test_level.level == @current_test.level }.pluck(:id)
    tests_succeeded = @current_user.test_passages.select(&:succeeded?).pluck(:test_id)
    (all_tests_on_level - tests_succeeded.uniq).empty?
  end
end
