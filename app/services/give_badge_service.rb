class GiveBadgeService
  RULES = [PassedFirstTryService, CompletedEntireLevelService, WholeCategoryPassedService].freeze

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    RULES.each { |rule| rule.new(@test_passage).call }
  end
end
