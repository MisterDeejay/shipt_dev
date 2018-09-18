class ExportStrategies::CsvStrategy
  def initialize(content, filename)
    @content = content
    @filename = filename
    @converter = JsonConverter.new
  end

  def export
    @converter.write_to_csv(@content, @filename)
  end
end
