class CompletedEntireLevelService < BadgeRulesService
  def rule_fulfilled?
    all_tests_on_level = Test.select { |test_level| test_level.level == @badge.rule_parameter }.pluck(:id)
    tests_succeeded = @current_user.test_passages.select(&:succeeded?).pluck(:test_id)
    (all_tests_on_level - tests_succeeded.uniq).empty?
  end
end
