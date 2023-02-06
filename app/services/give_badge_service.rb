class GiveBadgeService
  RULES = { first: PassedFirstTryService,
            level: CompletedEntireLevelService,
            category: WholeCategoryPassedService }.freeze

  def initialize(test_passage)
    # @current_test = test_passage.test
    @current_user = test_passage.user
    @badges = Badge.all
  end

  # def call
  #   RULES.each do |rule, service|
  #     if service.new.rule_fulfilled?(@current_test, @current_user)
  #       @current_user.badges << Badge.select { |badge| badge.rule == "#{rule}" }
  #     end
  #   end
  # end
  def call
    @badges.each do |badge|
      rule = RULES[badge.rule.to_sym].new
      @current_user.badges << badge if rule.rule_fulfilled?(badge, @current_user)
    end
  end
end
