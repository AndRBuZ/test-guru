class PassedFirstTryService
  def initialize(test_passage)
    @current_test = test_passage.test
    @current_user = test_passage.user
  end

  def call
    @current_user.badges << Badge.select { |badge| badge.rule == 'first' } if passed_first_try?
  end

  private

  def passed_first_try?
    current_test_passaging = @current_user.test_passages.select do |test_passage|
      test_passage.user_id == @current_user.id && test_passage.test_id == @current_test.id
    end
    current_test_succeeded = current_test_passaging.select(&:succeeded?)
    current_test_passaging.count == 1 && current_test_succeeded.count == 1
  end
end
