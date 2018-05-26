require 'yaml'
require "sequel"

namespace :db do
  env = ENV.fetch('RACK_ENV', 'development')
  puts "Processing task in #{env} environment."

  $db_hash = YAML.load(File.read("config/database.yml"))[env]
  encoding = $db_hash['encoding'] || ENV['CHARSET'] || 'utf8'
  Sequel.extension :migration
  DB = -> { Sequel.connect($db_hash) }

  desc 'Create db'
  task :create do
    begin
      system("createdb", "-E", encoding, "-h", $db_hash['host'], $db_hash['database'])
      Sequel.connect($db_hash)
      puts 'Database created:', $db_hash['database']
    rescue => e
      puts e
      puts "Oops"
    end
  end

  desc 'Drop db'
  task :drop do
    begin
      DB.call.disconnect
      system("dropdb", "-h", $db_hash['host'], $db_hash['database'])
      puts 'Database dropped:', $db_hash['database']
    rescue => e
      puts e
      puts "Oops"
    end
  end

  desc "Prints current schema version"
  task :version do
    version = if DB.call.tables.include?(:schema_info)
                DB.call[:schema_info].first[:version]
              end || 0
    puts "Schema Version: #{version}"
  end

  desc "Perform migration up to latest migration available"
  task :migrate do
    Sequel::Migrator.run(DB.call, "db/migrations")
    Rake::Task['db:version'].execute
  end

  desc "Perform rollback to specified target or full rollback as default"
  task :rollback, :target do |t, args|
    args.with_defaults(:target => 0)

    Sequel::Migrator.run(DB.call, "db/migrations", :target => args[:target].to_i)
    Rake::Task['db:version'].execute
  end

  desc "Perform migration reset (full rollback and migration)"
  task :reset do
    Sequel::Migrator.run(DB.call, "db/migrations", :target => 0)
    Sequel::Migrator.run(DB.call, "db/migrations")
    Rake::Task['db:version'].execute
  end
end
