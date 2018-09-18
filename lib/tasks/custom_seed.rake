namespace :db do
  namespace :seed do
    Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].each do |filename|
      task_name = File.basename(filename, '.rb').intern
      task task_name => :environment do
        load(filename) if File.exist?(filename)
      end
    end
  end

  task :seed do
    puts "EXECUTING CUSTOM SEED"
    load File.join(Rails.root, 'db', 'seeds', 'customers.rb')
    load File.join(Rails.root, 'db', 'seeds', 'categories.rb')
    load File.join(Rails.root, 'db', 'seeds', 'products.rb')
    load File.join(Rails.root, 'db', 'seeds', 'orders.rb')
    load File.join(Rails.root, 'db', 'seeds', 'items.rb')
  end
end
