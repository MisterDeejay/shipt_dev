class Analyzers::CustomerPurchaseAnalyzer
  def initialize(strategy = 'Analyzers::Strategies::CategoryQuantityStrategy')
    @strategy = strategy.constantize.new
  end

  def analyze
    @strategy.analyze
  end
end
