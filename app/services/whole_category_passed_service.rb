class WholeCategoryPassedService < BadgeRulesService
  def rule_fulfilled?
    all_tests_in_category = Test.select { |category| category.category_id == @badge.rule_parameter }.pluck(:id)
    tests_succeeded = @current_user.test_passages.select(&:succeeded?).pluck(:test_id)
    (all_tests_in_category - tests_succeeded.uniq).empty?
  end
end
