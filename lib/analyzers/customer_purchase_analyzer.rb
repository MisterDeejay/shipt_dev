class Analyzers::CustomerPurchaseAnalyzer
  def initialize(strategy = 'CategoryQuantityStrategy')
    @strategy = strategy.constantize.new
  end

  def analyze
    @strategy.analyze
  end
end
