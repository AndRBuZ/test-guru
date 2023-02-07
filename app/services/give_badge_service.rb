class GiveBadgeService
  RULES = { first: PassedFirstTryService,
            level: CompletedEntireLevelService,
            category: WholeCategoryPassedService }.freeze

  def initialize(test_passage)
    @current_user = test_passage.user
    @badges = Badge.all
  end

  def call
    @badges.each do |badge|
      rule = RULES[badge.rule.to_sym].new(badge, @current_user)
      @current_user.badges << badge if rule.rule_fulfilled?
    end
  end
end
