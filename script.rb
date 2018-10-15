require_relative './db_connection.rb'
require_relative './file_finder.rb'

files_list = Dir.children("sqlfiles")

def daily_update(files_list)
  newest_file = newest_file_number(files_list)
  db_version = DatabaseConnection.get_db_version
  if newest_file > db_version
    files_to_exec = find_files_to_exec(files_list, db_version)
    sorted_files = sort_files_in_numerical_order(files_to_exec)
    queries_to_exec = get_all_queries(sorted_files)
    DatabaseConnection.execute_queries(queries_to_exec)
    DatabaseConnection.update_db_version(db_version, newest_file)
    p "DB was succesfully updated"
  else
    p 'DB is up to date'
  end
end
daily_update(files_list)
