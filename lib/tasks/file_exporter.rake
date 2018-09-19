require 'json_converter'

namespace :file_exporter do
  desc "Returns a CSV filename of items sold by quantity per day, week or month"
  task :product_sales_by, [:filename, :interval, :start_date, :end_date] => :environment do |t, args|
    content = Analyzers::ProductSalesAnalyzer.new(
      args[:interval],
      Date.parse(args[:start_date]),
      Date.parse(args[:end_date])
    ).analyze

    FileExporter.new(
      content.to_json,
      File.expand_path("../data/", __FILE__) << "/" << args[:filename]
    ).export

    puts "Output to #{args[:filename]} succesful"
  end

  desc "Return output of products by category for every customer"
  task :category_sales_totals, [:filename] => :environment do |t, args|
    content = Analyzers::CustomerPurchaseAnalyzer.new.analyze

    FileExporter.new(
      content.to_json,
      File.expand_path("../data/", __FILE__) << "/" << args[:filename]
    ).export
  end
end
