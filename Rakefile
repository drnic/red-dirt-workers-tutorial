desc "Create database schema"
task :db_create do
  require "uri"
  database_uri = URI.parse(ENV['DATABASE_URL'])
  db = database_uri.path.split("/").last
  sh "cat schema.sql | psql #{db}"
end