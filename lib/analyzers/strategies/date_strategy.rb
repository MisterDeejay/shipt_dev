class Analyzers::Strategies::DateStrategy < Analyzers::Strategies::BaseStrategy
  def initialize(start_date, end_date, interval)
    @start_date, @end_date = start_date, end_date
  end

  def analyze
    Item.created_between(@start_date, @end_date).group_by_interval('week').count
  end
end
