class FileExporter
  def initialize(content, filename, strategy = '::ExportStrategies::CsvStrategy')
    @strategy = strategy.constantize.new(content, filename)
  end

  def export
    @strategy.export
  end
end
