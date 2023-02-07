class PassedFirstTryService < BadgeRulesService
  def rule_fulfilled?
    current_test_passaging = @current_user.test_passages.select do |test_passage|
      test_passage.user_id == @current_user.id && test_passage.test_id == @badge.rule_parameter
    end
    current_test_succeeded = current_test_passaging.select(&:succeeded?)
    current_test_passaging.count == 1 && current_test_succeeded.count == 1
  end
end
