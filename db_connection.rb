require 'mysql2'
require 'dotenv/load'

class DatabaseConnection
  HOST = ENV["HOST"]
  USERNAME = ENV["USERNAME"]
  PASSWORD = ENV['PASSWORD']

  def self.get_db_version
    client = Mysql2::Client.new(host: HOST, username: USERNAME, password: PASSWORD, database: 'ecs_test')
    results = client.query('SELECT version FROM versionTable')

    db_version = 0
    results.each do |row|
      db_version += row['version']
    end
    db_version
  end

  def self.update_db_version(current_version, last_statement)
    client = Mysql2::Client.new(host: HOST, username: USERNAME, password: PASSWORD, database: 'ecs_test')

    update = client.query("UPDATE versionTable SET version = #{last_statement} WHERE version = #{current_version}")
  end

  def self.execute_queries(queries_array)
    queries_array.each do |sql|
      client = Mysql2::Client.new(host: HOST, username: USERNAME, password: PASSWORD, database: 'ecs_test')
      client.query(sql)
    end
  end
end
