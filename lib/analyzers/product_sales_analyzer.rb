class Analyzers::ProductSalesAnalyzer
  def initialize(interval, start_date, end_date, strategy = 'Analyzers::Strategies::DateStrategy')
    @strategy = strategy.constantize.new(start_date, end_date, interval)
  end

  def analyze
    @strategy.analyze
  end
end
